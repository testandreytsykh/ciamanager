/**
 * Created by new on 17.08.2017.
 */

@IsTest
public with sharing class LeadProcessorTest {
	@TestSetup
	static void setup() {
		List<Lead> leads = new List<Lead>();

		for (Integer i=0;i<10;i++) {
			leads.add(new Lead(LastName='Lead '+i,Company='Company '+i));
		}

		insert leads;
	}

	@IsTest
	static void test(){
		System.Test.startTest();
		LeadProcessor leadProcessor = new LeadProcessor();
		Id batchId = Database.executeBatch(leadProcessor);
		System.Test.stopTest();

		System.assertEquals(10,[SELECT count() FROM Lead]);
	}
}