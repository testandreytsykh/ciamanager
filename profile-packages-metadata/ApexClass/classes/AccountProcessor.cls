/**
 * Created by new on 17.08.2017.
 */

public with sharing class AccountProcessor {

	@Future
	public static void countContacts(List<Id> accounIds) {
		List<Account> listAccounts = [
				SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts)
				FROM Account
				WHERE Id IN :accounIds
		];

		for(Account acc: listAccounts){
			acc.Number_of_Contacts__c=acc.Contacts.size();
		}

		Database.update(listAccounts);
	}
}