/**
 * Created by new on 17.08.2017.
 */

public with sharing class AddPrimaryContact implements Queueable {

	private Contact contact;
	private String str;

	public AddPrimaryContact(Contact contact, String str){
		this.contact=contact;
		this.str=str;
	}

	public void execute(QueueableContext context) {
		List<Account> accounts = [SELECT Id, BillingState FROM Account WHERE BillingState=:str];
		List<Contact> contacts = new List<Contact>();

		for (Account acc: accounts) {
			Contact c = contact.clone();
			c.AccountId=acc.Id;
			contacts.add(c);
		}

		update accounts;
		insert contacts;
	}

}