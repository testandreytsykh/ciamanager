/**
 * Created by new on 18.08.2017.
 */

global with sharing class DailyLeadProcessor implements Schedulable{
	global void execute(SchedulableContext ctx){
		List<Lead> leads = [SELECT Id, LeadSource FROM Lead LIMIT 200];

		for(Lead lead: leads){
			lead.LeadSource='Dreamforce';
		}

		update leads;
	}
}