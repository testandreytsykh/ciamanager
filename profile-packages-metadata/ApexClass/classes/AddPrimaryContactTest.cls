@IsTest
public with sharing class AddPrimaryContactTest {
	@TestSetup
	static void setup(){
		List<Account> accounts = new List<Account>();

		for (Integer i=0; i<50; i++) {
			accounts.add(new Account(Name='Test Account '+i, BillingState='NY'));
		}
		for (Integer i=50; i<100; i++) {
			accounts.add(new Account(Name='Test Account '+i, BillingState='CA'));
		}
		insert accounts;
	}

	@IsTest
	static void test(){
		Contact contact = new Contact(LastName='Test Contact LastName');

		AddPrimaryContact addPrimaryContact = new AddPrimaryContact(contact, 'CA');

		Test.startTest();
		System.enqueueJob(addPrimaryContact);
		Test.stopTest();

		System.assertEquals(50,[SELECT count() FROM Contact WHERE Account.BillingState='CA']);
	}
}