package com.drugstore.pdp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtility {

	public static String formateDate(Date date, String pattern){
		if(date==null) return "";
		if(pattern==null || "".equals(pattern)) pattern="MM/dd/yyyy HH:mm:ss";
		
		SimpleDateFormat formatter = new SimpleDateFormat();
		formatter.applyPattern(pattern);
		return formatter.format(date);
	}
	
	
	
	public static String formateDate(Date date){
		if(date==null) return "";
		
		SimpleDateFormat formatter = new SimpleDateFormat();
		formatter.applyPattern("MM/dd/yyyy HH:mm:ss");
		return formatter.format(date);
	}
	
	public static Date  getDate(String dateStr, String pattern){
		
		if(pattern == null || "".equals(pattern)) pattern = "MM/dd/yyyy HH:mm:ss";
		Date date = null;
		
		SimpleDateFormat formatter = new SimpleDateFormat();		
		formatter.applyPattern(pattern);
		try {
			date = formatter.parse(dateStr);
		}catch (ParseException e) {e.printStackTrace();}
		
		return date;
	}
	
	public static Date getDate(String dateStr){
		
		String pattern = "MM/DD/YYYY HH:MI:SS";
		Date date = null;
		
		SimpleDateFormat formatter = new SimpleDateFormat();		
		formatter.applyPattern(pattern);
		try {
			date = formatter.parse(dateStr);
		}catch (ParseException e) {e.printStackTrace();}
		
		return date;
	}
	
  public static String getDateWithText(int day){
		
	if(day>=11 && day<=13){
		return "th";
	}
	 switch(day%10){
		 case 1:
			 return "st";
		 case 2:
			 return "nd";
		 case 3:
			 return "rd";
		 default:
			 return "th";
	  }
	}
  public static int findDifference (Date secondDate) {
		int dateDifference = 0;
		Calendar firstCal = Calendar.getInstance();
		Calendar secondCal = Calendar.getInstance();
		try {
			if(secondDate!=null) {
				secondCal.setTime(secondDate);
				dateDifference = (int)((secondCal.getTimeInMillis()-firstCal.getTimeInMillis())/(1000*60*60*24))+1;
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return dateDifference;
	}
	
	public static void main(String[] args) {
		System.out.println(DateUtility.formateDate(new Date(), "MM/dd/yyyy hh:mm:ss:a"));
	
	}
	
	
}
