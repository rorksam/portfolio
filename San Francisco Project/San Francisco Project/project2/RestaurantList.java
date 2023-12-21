/**
 * 
 */
package project2;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.NoSuchElementException;
import java.util.Scanner;
/**
 * 
 */
public class RestaurantList extends ArrayList<Restaurant> {
	
	
	
	@Override
	public String toString() {
		String returningString = "";
		for(Restaurant r : this) {
			returningString = returningString + r.toString() + "\n";
		}
		return returningString;
	}
	public static void main(String args[]) {
		RestaurantList newList = new RestaurantList(args[0]);
	}
	public RestaurantList() {
		
	}

	public RestaurantList(String fileName) {
		this.createList(fileName);
	}
	
	public Restaurant stringSearch(Restaurant e, int low, int high) {
		if (high == -1 || high == 0) {
			return null;
		} else if (high < low) {
			return this.get(high);
		}
		
		int mid = (low + high)/2;
		if(low == high) {
			return this.get(mid);
		} else if (e.businessAddress.compareTo(this.get(mid).businessAddress) < 0) {
			return stringSearch(e, low, mid - 1);
		} else if (e.businessAddress.compareTo(this.get(mid).businessAddress) > 0) {
			return stringSearch(e, mid + 1, high);
		} else {
			return this.get(mid);
		}
	}
	
	public int insertionSort(Restaurant e) {
		int max = this.size();
		for (int i = 0; i < max; i ++) {
			if (e.compareTo(this.get(i)) < 0) {
				return i;
			}
		}
		return max;
	}
	
	public Restaurant newBinarySearch(Restaurant e, int low, int high) {
		if (high >= low && low <= this.size() - 1) {
			int mid = (low + high) / 2;
			
			if (this.get(mid).equals(e)) {
				return this.get(mid);
			}
			
			if(this.get(mid).compareTo(e) > 0) {
				return newBinarySearch(e, low, mid - 1);
			}
			
			if(this.get(mid).compareTo(e) < 0) {
				return newBinarySearch(e, mid + 1, high);
			}
			
			return newBinarySearch(e, mid + 1, high);
		}
		return null;
	}
	
	
	
	/**
	 * This method creates a RestaurantList based on a csv file, 
	 * if formatted like SF_restaurant_scores_full.csv.
	 * 
	 * @param name of file, as a string
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public void createList(String fileName) {
		File csvFile = new File(fileName); 
		if (!csvFile.exists()){
			System.err.println("Error: the file "+csvFile.getAbsolutePath()+" does not exist.\n");
			System.exit(1);
		}
		if (!csvFile.canRead()){
			System.err.println("Error: the file "+csvFile.getAbsolutePath()+
											" cannot be opened for reading.\n");
			System.exit(1);
		}
		
		//open the file for reading 
		Scanner csvData = null; 
		
		
		try {
			csvData = new Scanner (csvFile ) ;
		} catch (FileNotFoundException e) {
			System.err.println("Error: the file "+csvFile.getAbsolutePath()+
											" cannot be opened for reading.\n");
			System.exit(1);
		}
		
		String line = null; 
		ArrayList<String> splicedLine;
		boolean newEntry = false;
		Restaurant tempRest;
		csvData.nextLine();
		int indexSpot;
		while (csvData.hasNextLine()) {
			try { 
				line = csvData.nextLine(); 
				splicedLine = splitCSVLine(line);
				if(splicedLine.get(2).equals(null) || splicedLine.get(9).equals(null)) {
					try {
						tempRest = new Restaurant(splicedLine.get(1), splicedLine.get(5), 
								splicedLine.get(2), splicedLine.get(9));
						if(!splicedLine.get(12).equals("") && splicedLine.size() == 17) {
							tempRest.addInspection(new Inspection((new Date(splicedLine.get(11))), Integer.valueOf(splicedLine.get(12)), splicedLine.get(15), splicedLine.get(16)));
						}
						Restaurant copy = this.newBinarySearch(tempRest, 0, this.size()-1);
						if(copy == null) {
							indexSpot = this.insertionSort(tempRest);
							if(!tempRest.businessName.equals("") && !tempRest.zipCode.equals(""))
							{
								this.add(indexSpot, tempRest);
							}
						} else if (tempRest.violationList.size() > 0) {
							copy.addInspection(tempRest.violationList.get(0));
						} 
						
					} catch (Exception e) {
						
					}
					
				} else {
					try {
						tempRest = new Restaurant(splicedLine.get(1), splicedLine.get(5));
						if(!splicedLine.get(12).equals("") && splicedLine.size() == 17) {
							tempRest.addInspection(new Inspection((new Date(splicedLine.get(11))),
									Integer.valueOf(splicedLine.get(12)), splicedLine.get(15),
									splicedLine.get(16)));
						}
						Restaurant copy = this.newBinarySearch(tempRest, 0, this.size()-1);
						if(copy == null) {
							indexSpot = this.insertionSort(tempRest);
							if(!tempRest.businessName.equals("") && !tempRest.zipCode.equals("")) 
							{
								this.add(indexSpot, tempRest);
						
							}
						} else {
							if(!tempRest.violationList.isEmpty()) {
								copy.addInspection(tempRest.violationList.get(0));
							}
						}
					} catch (Exception e) {
						
					}
				}
			}
			catch (NoSuchElementException ex ) {
				//caused by an incomplete or miss-formatted line in the input file
				System.err.println(line);
				continue; 	
			}
		}
		
	}

	/**
	 * 2 * Splits the given line of a CSV file according to commas and double quotes
	 * 3 * (double quotes are used to surround multi-word entries so that they may
	 * contain commas) 4 * @author CSV 5 * @param textLine a line of text to be
	 * passed 6 * @return an Arraylist object containing all individual entries
	 * found on that line 7
	 */
	public static ArrayList<String> splitCSVLine(String textLine) {

		if (textLine == null)
			return null;

		ArrayList<String> entries = new ArrayList<String>();
		int lineLength = textLine.length();
		StringBuffer nextWord = new StringBuffer();
		char nextChar;
		boolean insideQuotes = false;
		boolean insideEntry = false;
		// iterate over all characters in the textLine
		for (int i = 0; i < lineLength; i++) {
			nextChar = textLine.charAt(i);
			// handle smart quotes as well as regular quotes
			if (nextChar == '"' || nextChar == '\u201C' || nextChar == '\u201D') {
				// change insideQuotes flag when nextChar is a quote
				if (insideQuotes) {
					insideQuotes = false;
					insideEntry = false;
				} else {
					insideQuotes = true;
					insideEntry = true;
				}
			} else if (Character.isWhitespace(nextChar)) {
				if (insideQuotes || insideEntry) {
					// add it to the current entry
					nextWord.append(nextChar);
				} else { // skip all spaces between entries
					continue;
				}
			} else if (nextChar == ',') {
				if (insideQuotes) { // comma inside an entry
					nextWord.append(nextChar);
				} else { // end of entry found
					insideEntry = false;
					entries.add(nextWord.toString());
					nextWord = new StringBuffer();
				}
			} else {
				// add all other characters to the nextWord
				nextWord.append(nextChar);
				insideEntry = true;
			}
		}
		// add the last word ( assuming not empty )
		// trim the white space before adding to the list
		if (!nextWord.toString().equals("")) {
			entries.add(nextWord.toString().trim());
		}
		return entries;

	}
	/**
	 * This method searches a RestaurantList for a name or zip code.
	 * 
	 * @param *String term* is the search term, and *char type* is the type of search: n for 
	 * name and z for zip.
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public RestaurantList search(String term, char type) {
		RestaurantList results = new RestaurantList();
		if (type == 'n') {
			for (Restaurant r : this) {
				if(r.businessName.toLowerCase().contains(term.toLowerCase())) {
					results.add(r);
				}
			}
		} else if (type == 'z') {
			for (Restaurant r : this) {
				if(r.zipCode.contains(term)) {
					results.add(r);
				}
			}
			results = this.bubbleSort(results);
		}
		System.out.println(results);
		return results;
	}
	
	/**
	 * This sorts a list of restaurants, inefficient but is only utilized for a small list of 
	 * restaurants in the case of searching via zip code, so it has little affect on the overall
	 * performance of the program.
	 * 
	 * @param RestaurantList results
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public RestaurantList bubbleSort(RestaurantList results) {
		Restaurant temp;
		for(int i = 0; i < results.size() - 1; i ++) {
			for (int g = i; g < results.size() - 1; g ++) {
				if(results.get(g).violationList.size() > 0 && 
						results.get(g + 1).violationList.size() > 0) {
					if(results.get(g).violationList.get(0).score > 
					results.get(g + 1).violationList.get(0).score) {
						temp = results.get(g + 1);
						results.set(g+1, results.get(g));
						results.set(g, temp);
					}
				}
			}
		}
		if(results.size() > 3) {
			results.removeRange(2, results.size() - 1);
		}
		
		return results;
	}
}
