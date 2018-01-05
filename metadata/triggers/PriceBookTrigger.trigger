/**
 * Created by new on 17.08.2017.
 */

trigger PriceBookTrigger on PriceBook__c (before insert, before update, after insert, after update) {
	if(Trigger.isBefore){
		if(Trigger.isUpdate){
			PriceBookTriggerHandler.setStatusUpdate(Trigger.new,Trigger.oldMap);
		}else if(Trigger.isInsert){
			PriceBookTriggerHandler.setStatusInsert(Trigger.new);
		}
	}else if(Trigger.isAfter){
		if(Trigger.isInsert || Trigger.isUpdate){
			PriceBookTriggerHandler.setAccountsInCars(Trigger.new);
		}
	}
}