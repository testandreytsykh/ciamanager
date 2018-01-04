/**
 * Created by new on 14.08.2017.
 */

@isTest
public with sharing class TestRestrictContactByName {
	@isTest static void testRestrictContactByName(){
		Contact contact = new Contact(LastName='INVALIDNAME');

		Test.startTest();
		Database.SaveResult result = Database.insert(contact,false);
		Test.stopTest();

		System.assert(!result.isSuccess());
		System.assert(result.getErrors().size()>0);
		System.assertEquals('The Last Name "'+contact.LastName+'" is not allowed for DML',
				result.getErrors()[0].getMessage());


	}
}