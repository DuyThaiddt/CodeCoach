package controller.booking;

import java.text.Normalizer;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Pattern;

public class Utilities {
    public static String convertToNonDiacritics(String input) {
        String decomposed = Normalizer.normalize(input, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        return pattern.matcher(decomposed).replaceAll("");
    }

    public static Date getStartDateOfWeek(Calendar calendar){
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        return calendar.getTime();
    }

    public static void main(String[] args) {
        Date date = new Date("2021/05/10");
        System.out.println();
    }
}
