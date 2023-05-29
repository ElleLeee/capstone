package test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ScriptMaker {

	public static void main(String[] args) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance(); // get the current date and time
		
		for(int i = 0; i < 365; i++) {
			Date d = cal.getTime();
			String fullDate = sdf.format(d);
			@SuppressWarnings("deprecation")
			int year = d.getYear()+1900;
			String dayName = new SimpleDateFormat("EEEE").format(d);
			int dayNumber = cal.get(Calendar.DAY_OF_MONTH);
			String monthName = new SimpleDateFormat("MMMM").format(d);
			
			System.out.println("insert into day(fulldate,year, dayname, daynumber, monthname) values(DATE '" + fullDate + "', " +year+", '" + dayName + "', " + dayNumber + ", '" + monthName + "');");
			
			cal.add(Calendar.DAY_OF_YEAR, 1); // increment the day by 1
		}

	}

}
