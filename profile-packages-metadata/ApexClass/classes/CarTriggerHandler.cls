public with sharing class CarTriggerHandler {
	public static void setCategories(List<Car__c> cars){
		for(Car__c car: cars){
			if(car.Speed__c < 150){
				car.Category__c='Сargo';
			}else if(car.Speed__c >= 150&&car.Speed__c <=200){
				car.Category__c='Passenger car';
			}else {
				car.Category__c='Sport car';
			}
		}
	}
}