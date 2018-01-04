public with sharing class AlertController {
	@AuraEnabled
	public static String getSessionId() {
		return UserInfo.getSessionId();
	}

	@AuraEnabled
	public static Case[] getAll(){
		return [SELECT Id, CaseNumber, field1__c, field2__c, field3__c FROM Case];
	}

}