/**
 * Created by new on 25.09.2017.
 */
@isTest
private with sharing class AccountManagerTest {
	@isTest static void testGetCaseById() {
		Id recordId = createTestRecord();
		// Set up a test request
		RestRequest request = new RestRequest();
		request.requestUri =
				'https://yourInstance.salesforce.com/services/apexrest/Accounts/'
						+ recordId+'/contacts';
		request.httpMethod = 'GET';
		RestContext.request = request;
		// Call the method to test
		Account thisAccount = AccountManager.getAccount();
		// Verify results
		System.assert(thisAccount != null);
		System.assertEquals('Name1', thisAccount.Name);
	}

	static Id createTestRecord() {
		// Create test record
		Account accountTest = new Account(
				Name = 'Name1');
		insert accountTest;
		return accountTest.Id;
	}
}