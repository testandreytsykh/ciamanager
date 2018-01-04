/**
 * Created by new on 18.08.2017.
 */

public with sharing class NewCaseListController {

	private String status = 'New';

	public List<Case> getNewCases(){
		return [SELECT Id, CaseNumber FROM Case WHERE Status=:status];
	}
}