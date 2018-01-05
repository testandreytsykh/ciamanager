@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substring(
                request.requestURI.indexOf('Accounts/') + 9, request.requestURI.indexOf('/contacts'));
        System.debug(accountId);
        Account result = [
                SELECT Id, Name, (SELECT Id, Name FROM Contacts)
                FROM Account
                WHERE Id = :accountId
        ];
        System.debug(accountId);
        return result;
    }
}