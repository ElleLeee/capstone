package test;

import java.util.ArrayList;
import java.util.List;

public class Day {
	private String day;
	private int daynum;
	public ArrayList<Times> times;
	
	public Day(String day, int daynum) {
		this.day=day;
		this.daynum=daynum;
		this.times=new ArrayList<>();
	}
	
	public void addTime(Times t) {
		times.add(t);
	}
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getDaynum() {
		return daynum;
	}
	public void setDaynum(int daynum) {
		this.daynum = daynum;
	}
	
	
}
