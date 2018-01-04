@IsTest
public with sharing class AccountProcessorTest {
	@IsTest
	public static void countContacts() {
		Account acc1 = new Account(Name = 'testName1');

		Database.insert(acc1);

		Contact con1_1 = new Contact(LastName = 'testLastName1_1', AccountId = acc1.Id);
		Contact con1_2 = new Contact(LastName = 'testLastName1_2', AccountId = acc1.Id);

		Database.insert(new List<Contact>{
				con1_1, con1_2
		});

		Test.startTest();
		AccountProcessor.countContacts(new List<Id>{
				acc1.Id
		});
		Test.stopTest();

		List<Account> accounts = [SELECT Id, Number_of_Contacts__c FROM Account];

		System.assertEquals(1, accounts.size());
		System.assertEquals(2, accounts[0].Number_of_Contacts__c);

	}
}