/**
 * Created by new on 14.08.2017.
 */

public with sharing class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer numberOfContact, String name){
		List<Contact> contacts = new List<Contact>();

		for(Integer i=0; i<numberOfContact; i++){
			contacts.add(new Contact(FirstName='Test '+i));
		}

		return contacts;
	}
}