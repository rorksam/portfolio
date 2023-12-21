/**
 * 
 */
package project2;
import java.util.ArrayList;
/**
 * 
 */
public class Restaurant implements Comparable<Restaurant>{
	
	String businessName; //variables, all strings bc they're read as strings
	String businessAddress;	//and just need to be printed as strings
	String phoneNumber;
	String zipCode;
	ArrayList<Inspection> violationList = new ArrayList<Inspection>();
	
	
	/**
	 * This constructor takes a name and zip code to create a new Restaurant object
	 * @param name of the restaurant, zip code of the restaurant
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public Restaurant (String name, String zip) throws IllegalArgumentException {
		if (name.equals(null)) { //looking for illegal argument (name is null)
			throw new IllegalArgumentException("Restaurant name is null, Restaurant object"
					+ " could not be made");
		} else if (zip.equals(null)) { //looking for illegal argument (zip is null)
			throw new IllegalArgumentException("Restaurant zip code is null, Restaurant object"
					+ " could not be made");
		}		
		businessName = name; //assignments vv
		zipCode = zip;
	}
	
	/**
	 * This constructor takes the name, zip, address, and phone # of a restaurant and creates
	 * an object based off that.
	 * 
	 * @param name, zip, address, and phone of a restaurant.
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public Restaurant (String name, String zip, String address, String phone) 
			throws IllegalArgumentException {
		if (name.equals(null)) { //looking for name == null illegal argument
			throw new IllegalArgumentException("Restaurant name is null, Restaurant"
					+ " object could not be made");
		} else if (zip.equals(null)) { //looking for zip == null illegal argument
			throw new IllegalArgumentException("Restaurant zip code is null, Restaurant"
					+ " object could not be made");
		} else if (address.equals(null)) { //looking for address == null illegal argument
			throw new IllegalArgumentException("Restaurant address is null, Restaurant"
					+ " object could not be made");
		} else if (phone.equals(null)) { //looking for phone == null illegal argument
			throw new IllegalArgumentException("Restaurant phone number is null, Restaurant"
					+ " object could not be made");
		}
		
		businessName = name; //assignments vvvv
		zipCode = zip;
		businessAddress = address;
		phoneNumber = phone;
	}
	
	
	/**
	 * This method adds an inspection object to the violationList.
	 * 
	 * @param Inspection object inspect
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public void addInspection(Inspection inspect) throws IllegalArgumentException {
		if (inspect == null) { //looking for inspection == null illegal argument
			throw new IllegalArgumentException("Restaurant inspection is null, inspection"
					+ " could not be added");
		}
		int i = 0;
		while (i < violationList.size()) {
			if(violationList.get(i).score < inspect.score) {
				violationList.add(i, inspect);
				return;
			}
			i ++;
		}
		if(violationList.size() == 0) {
			violationList.add(inspect);
		}
//		//violationList.add(inspect); //adding the inspection to the ArrayList<Inspection>
		violationList.add(inspect);
	}
	
	

	public boolean equals(Restaurant o) {
		return (this.compareTo(o) == 0);
	}

	/**
	 * This method creates a string for the Restaurant object.
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	@Override
	public String toString() {
		String returning = "" + businessName + "\n------------------------\naddress\t\t\t : "
				+ businessAddress
				+ "\nzip\t\t\t : " + zipCode
				+ "\nphone\t\t\t : " + phoneNumber
				+ "\nrecent inspection results:\n";
		for (Inspection i : violationList) {
			returning = returning + i.toString() + "\n";
		}
		return returning;
	}

	/**
	 * This method compares Restaurant objects. Implementation of the compareTo interface.
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	@Override
	public int compareTo(Restaurant o) {
		if(this.businessName.compareTo(o.businessName) == 0) { //using String .compareTo() method
										  //to check the primary key (if 0, then names are equal)
			if(this.zipCode.compareTo(o.zipCode) == 0) { //checking secondary key
				return 0;	//if both keys are equal, then the restaurants are deemed equal
			} else {
				return this.zipCode.compareTo(o.zipCode); //if primary key is equal but secondary
				//isn't, then the zip code comparison is the Restaurant comparison
			}
		}
		return this.businessName.compareTo(o.businessName); //if first key isn't equal, then 
		//first key comparison is Restaurant comparison
	}
	
}
