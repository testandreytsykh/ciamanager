/**
 * Created by new on 09.08.2017.
 */

public with sharing class ContactAndLeadSearch {
	public static List<List< SObject>> searchContactsAndLeads(String firstOrLastName){
				List<List< SObject>> listSObjects = [FIND :firstOrLastName IN ALL FIELDS
						RETURNING Contact(FirstName,LastName), Lead(FirstName,LastName)];

		return listSObjects;
	}
}