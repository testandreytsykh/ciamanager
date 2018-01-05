/**
 * Created by new on 14.08.2017.
 */

@isTest
public with sharing class TestVerifyDate {
	@isTest static void testCheckDates(){
		Date testDate1 = Date.newInstance(2017,08,14);
		Date testDate2 = Date.newInstance(2017,09,12);

		Date actualDate = VerifyDate.CheckDates(testDate1,testDate2);
		Date expectedDate = testDate2;

		System.assertEquals(expectedDate,actualDate);
	}

	@isTest static void testCheckDatesSetEndOfMonthDate(){
		Date testDate1 = Date.newInstance(2017,08,14);
		Date testDate2 = Date.newInstance(2017,10,12);

		Date actualDate = VerifyDate.CheckDates(testDate1,testDate2);
		Date expectedDate = Date.newInstance(2017,08,31);

		System.assertEquals(expectedDate,actualDate);
	}


}