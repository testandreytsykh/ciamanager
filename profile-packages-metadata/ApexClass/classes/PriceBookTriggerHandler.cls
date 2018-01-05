public with sharing class PriceBookTriggerHandler {

	public static void setStatusUpdate(List<PriceBook__c> newPriceBooks, Map<Id, PriceBook__c> oldMapBooksByIds){
		for(PriceBook__c priceBook: newPriceBooks){
			if(oldMapBooksByIds.get(priceBook.Id).Account__r!=null && priceBook.Account__r==null){
				priceBook.addError('You can\'t delete existed Account');
			}else {
				if (oldMapBooksByIds.get(priceBook.Id).Account__r != null &&
						priceBook.Account__r != oldMapBooksByIds.get(priceBook.Id).Account__r) {
					priceBook.Status__c = 'used';
				} else if (oldMapBooksByIds.get(priceBook.Id).Account__r == null && priceBook.Account__r != null) {
					priceBook.Status__c = 'sold';
				}
			}
		}
	}
	public static void setStatusInsert(List<PriceBook__c> priceBooks){
		for(PriceBook__c priceBook: priceBooks){
			if(priceBook.Account__r==null){
				priceBook.Status__c='new';
			}else {
				priceBook.Status__c='sold';
			}
		}

	}
	public static void setAccountsInCars(List<PriceBook__c> priceBooks){
		Map<String, Id> mapIdsByModels = new Map<String, Id>();
		for(PriceBook__c priceBook: priceBooks){
			mapIdsByModels.put(priceBook.Model__c, priceBook.Account__c);
		}

		List<Car__c> cars = [
				SELECT Id, Account__c, Model__c
				FROM Car__c
				WHERE Model__c IN :mapIdsByModels.keySet()
		];

		for (Car__c car: cars) {
			car.Account__c = mapIdsByModels.get(car.Model__c);
		}

		Database.update(cars);
	}
}