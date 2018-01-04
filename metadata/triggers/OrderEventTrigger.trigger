trigger OrderEventTrigger on Order_Event__e (after insert) {
	List<Task> tasks = new List<Task>();
	User user = [SELECT Id FROM User LIMIT 1];

	// Iterate through each notification.
	for (Order_Event__e event : Trigger.New) {
		if (event.Has_Shipped__c == true) {
			// Create Case to dispatch new team.
			Task t = new Task();
			t.Priority = 'Medium';
			t.Status = 'New';
			t.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
			t.OwnerId = user.Id;
			tasks.add(t);
		}
	}
// Insert all cases corresponding to events received.
	insert tasks;

}