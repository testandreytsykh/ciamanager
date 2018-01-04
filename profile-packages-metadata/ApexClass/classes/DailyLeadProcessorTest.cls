/**
 * Created by new on 18.08.2017.
 */

@IsTest
private class DailyLeadProcessorTest {
	public static String CRON_EXP = '0 0 0 15 3 ? 2022';

	static testMethod void testBehavior() {
		List<Lead> leads =  new List<Lead>();

		for(Integer i=0; i<200; i++){
			leads.add(new Lead(LastName='Test Name '+i, Company='Test NameCompany '+i));
		}

		insert leads;

		Test.startTest();
		System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor());
		Test.stopTest();

		List<Lead> l = [
				SELECT Id, LeadSource
				FROM Lead WHERE LeadSource='Dreamforce'
				LIMIT 200
		];

		System.assertEquals(leads.size(),l.size());
	}
}