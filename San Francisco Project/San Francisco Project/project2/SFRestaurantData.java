/**
 * 
 */
package project2;
import java.util.Scanner;
/**
 * 
 */
public class SFRestaurantData {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Scanner key = new Scanner(System.in); //keyboard input
		boolean quitApp = false; //tracking if the system should keep running
		RestaurantList mainList; //initializing early to tell what kind of file input we get
		if(args.length > 0) { //if there are args, use them
			mainList = new RestaurantList(args[0]);
		} else { //if no args, use the hardcode file name
			mainList = new RestaurantList("SF_restaurant_scores_full.csv");
		}
		do { //program loop
			System.out.println("Enter your search query:");
			String userValue = key.nextLine();
			String[] userValues = userValue.split(" "); //splitting search values by type and query
			String firstValue = userValues[0];
			String secondValue;
			if(userValues.length > 1) { //making sure there are 2 values: quit command only has 1
				secondValue = userValues[1];
			} else {
				secondValue = null;
			}
			
			if(firstValue.equalsIgnoreCase("name")) {
				if (secondValue != null) {
					if(mainList.search(secondValue, 'n').size() == 0) {    //prints the results,
						System.out.println("No matches found. Try again.");//prints this if results
					}													   //is empty
				}
			} else if (firstValue.equalsIgnoreCase("zip")) { //sorting and limit of 3 in function
				if (secondValue != null) {
					if(mainList.search(secondValue, 'z').size() == 0) {
						System.out.println("No matches found. Try again.");
					}
				}
			} else if (firstValue.equalsIgnoreCase("quit")) {
				System.out.println("Thanks for using SFRESTAURANTDATA.");
				quitApp = true; //break the programming loop
			} else {
				System.out.println("Invalid query. Please try again.");
			}
			
		} while (!quitApp);
		
	}

}
