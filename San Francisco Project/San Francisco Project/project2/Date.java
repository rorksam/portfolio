/**
 * @author Sam Rork
 */
package project2;

/**
 * 
 */
public class Date implements Comparable<Date>{
	
	
	/**
	 * This method compares creates a string output for the Date class.
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	@Override
	public String toString() {
		if(this.year < 100) { //if year is 2 digits 
			return "" + month + "/" + day + "/20" + year; //2 digits so return format
												//"MM/DD/20YY"
		} else {
			return "" + month + "/" + day + "/" + year; //4 digits so return format
												//"MM/DD/YYYY"
		}
	}

	/**
	 * This method compares date objects, first by year, then month, then day.
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	@Override
	public int compareTo(Date o) {
		if(this.year == o.year) { //checks if years are equal
			if (this.month == o.month) { //checks if months and years are equal
				if (this.day == o.day) { //checks if days and months and years are equal
					return 0;	//if all 3 are equal, dates are equal
				} else {
					return (this.day - o.day); //if just months and years are equals,
												//compare the days
				}
			} else { //if just years are equal, just compare the months
				return (this.month - o.month);
			}
		}
		return (this.year - o.year); //if years are not equal, compare years
	}

	private int day;
	private int month;
	private int year;
		
	/**
	 * @param date 	The first constructor should throw an instance of IllegalArgumentException
	 *  if it is called with a null parameter, or a string that does not match either MM/DD/YYYY
	 *   or MM/DD/YY pattern, or a string that matches the pattern, but for which the values are
	 *   invalid (see below). Note: the MM and DD specifications should always be exactly two
	 *   characters long, so for January 5, 2019, the string will be “01/05/19” or “01/05/2019”.
	 *   
	 *   @author Sam Rork
	 *   @version 10/30/2023
	 */
	public Date(String date) throws IllegalArgumentException {
		int tryMonth = 0;
		int tryDay = 0;
		int tryYear = 0;
		if (date == null) {
			throw new IllegalArgumentException("This date is null");
		}
		
		try {
			String[] splitting = date.split("/");
			String yearing = splitting[2].split(" ")[0];
			if(date.split("/")[0|1].length() != 2) {
				throw new IllegalArgumentException("date invalid");
			}
			if(yearing.length() != 2 && yearing.length() != 4) {
				throw new IllegalArgumentException("date invalid");
			}
			tryMonth = Integer.valueOf(date.split("/")[0]);
			tryDay = Integer.valueOf(date.split("/")[1]);
			if(yearing.length() == 2) {
				tryYear = Integer.valueOf(yearing) + 2000;
			} else {
				tryYear = Integer.valueOf(yearing);
			}
			
		} catch (Exception e) {
			throw e;
		} 
		try {
			if(dateChecker(tryMonth, tryDay, tryYear)) {
				this.month = tryMonth;
				this.day = tryDay;
				this.year = tryYear;
			}
		} catch (IllegalArgumentException e) {
			throw e;
		}
	}
	
	
	/**
	 * Constructor for the date class, given ints.
	 * 
	 * @param numerals for month, day, and year.
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public Date(int month, int day, int year) throws IllegalArgumentException {
		try {
			if(dateChecker(month, day, year)) {
				this.month = month;
				this.day = day;
				this.year = year;
			}
		} catch (IllegalArgumentException e) {
			throw e;
		}
	}
	
	
	/**
	 * This method checks a given month, day, and year and checks to see if it's a valid date.
	 * 
	 * @param numerals for month, day, and year.
	 * 
	 * @return boolean: true if is a valid date, false otherwise	
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public boolean dateChecker(int month, int day, int year) throws IllegalArgumentException {
		boolean checksOut = true;
		if (year > 2025 || year < 2000) { //check for year out of range
			checksOut = false;
			throw new IllegalArgumentException("Year given in out of bounds");
		}
		
		if(day < 1) { //check for low date
			checksOut = false;
			throw new IllegalArgumentException("Day must be larger than one.");
		}
		if (month == 2 && day > 28) { //check February
			if(((year % 4) == 0 ) && day == 29) { //check for leap year
			} else {
				checksOut = false;
				throw new IllegalArgumentException("Date cannot be made, "
						+ "date exceeds Feb. boundaries");
			}
		} else if (((month == 4) || (month == 6) || (month == 9) || (month == 11)) && day > 30) {
			//check for 30 day months
			checksOut = false;
			throw new IllegalArgumentException("Date cannot be made, given month can only have "
					+ "30 days");
		} else if (day > 31) { //for all other months, make sure there aren't too many days
			checksOut = false;
			throw new IllegalArgumentException("Date cannot be made, the day cannot be over 31.");
		}
		
		return checksOut;
	}
}
