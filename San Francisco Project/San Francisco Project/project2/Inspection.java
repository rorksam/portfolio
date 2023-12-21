/**
 * 
 */
package project2;

/**
 * 
 */
public class Inspection {
	Date date;
	int score;
	String violation;
	String risk;
	
	/**
	 * This method creates an Inspection object
	 * 
	 * @param input a date, a score, a violation, and a risk factor
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	public Inspection (Date date, int score, String violation, String risk)
			throws IllegalArgumentException {
		if(date == null) {
			throw new IllegalArgumentException("Date value is null,"
					+ " cannot make Inspection");
		} else if (score > 100 || score < 1) {
			throw new IllegalArgumentException("score value is out of bounds,"
					+ " cannot make Inspection");
		}
		this.date = date;
		this.score = score;
		this.violation = violation;
		this.risk = risk;
	}

	/**
	 * This method creates a string for the Inspection object.
	 * 
	 * @author Sam Rork
	 * @version 10/30/2023
	 */
	@Override
	public String toString() {
		return "\t" + score + ", " + date + ", " + risk + ", " + violation;
	}
	
	
	
	
}
