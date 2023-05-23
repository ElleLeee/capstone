package test;

import java.util.ArrayList;

public class test {

    public static void main(String[] args) {

        Day d = new Day("Monday", 24);
        Times t = new Times(9, 10);
        d.addTime(t);
        t = new Times(10, 11);
        d.addTime(t);
        t = new Times(1, 2);
        d.addTime(t);
        t = new Times(3, 4);
        d.addTime(t);

        Day e = new Day("Tuesday", 25);
        t = new Times(9, 10);
        e.addTime(t);
        t = new Times(10, 11);
        e.addTime(t);
        t = new Times(1, 2);
        e.addTime(t);
        t = new Times(3, 4);
        e.addTime(t);

        ArrayList<Day> days = new ArrayList<>();
        days.add(d);
        days.add(e);

        for (int i = 0; i < days.size(); i++) { //instead of may it would be monthName
            System.out.println(days.get(i).getDay() + " : August " + days.get(i).getDaynum());
            System.out.println("Available times: ");

            ArrayList<Times> asd = days.get(i).times;

            for (int hour = 9; hour <= 12; hour++) {
                boolean found = false;
                for (Times time : asd) {
                    if (time.getStart() == hour) {
                        System.out.println("Start: " + time.getStart() + ". End: " + time.getEnd());
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    System.out.println();
                }
            }

            for (int hour = 1; hour <= 5; hour++) {
                boolean found = false;
                for (Times time : asd) {
                    if (time.getStart() == hour) {
                        System.out.println("Start: " + time.getStart() + ". End: " + time.getEnd());
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    System.out.println();
                }
            }

            System.out.println();
        }
    }
}
