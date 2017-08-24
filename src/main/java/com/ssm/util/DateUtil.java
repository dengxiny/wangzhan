package com.ssm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateUtil {
	
	public static Date getDateBydatestr(String datestr,String formatestr){
		SimpleDateFormat sdf = new SimpleDateFormat(formatestr);
		Date date = null;
		try {
			date = sdf.parse(datestr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	
		
	}
	
	
	public static String getdatestrByDate(Date date,String formatestr){
		SimpleDateFormat sdf = new SimpleDateFormat(formatestr);
		String datestr = sdf.format(date);
		return datestr;
		
	}
	
	public static String TimeStamp2Date(String timestampString, String formats) {
        if (formats==null)
            formats = "yyyy-MM-dd HH:mm:ss";
       // String timestampString1 = String.valueOf(timestampString);
        Long timestamp = Long.parseLong(timestampString) * 1000;
        String date = new SimpleDateFormat(formats, Locale.CHINA).format(new Date(timestamp));
       
        return date;
    }
	
}
