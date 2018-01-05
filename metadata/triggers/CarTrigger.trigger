/**
 * Created by new on 16.08.2017.
 */

trigger CarTrigger on Car__c (before insert, before update) {
	CarTriggerHandler.setCategories(Trigger.new);
}