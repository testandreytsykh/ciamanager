/**
 * Created by new on 15.12.2017.
 */

trigger CaseTrigger on Case (after insert, after update ) {
    alertEvent__e[] messages = new alertEvent__e[]{};
    for (Case item : Trigger.new) {
        if (item.field1__c == true) {
            messages.add(new alertEvent__e(Message__c = 'Case no customer communication', caseId__c= item.Id));
        } else if (item.field2__c == true) {
            messages.add(new alertEvent__e(Message__c = 'Case untouched', caseId__c= item.Id));
        } else if (item.field3__c == true) {
            messages.add(new alertEvent__e(Message__c = 'Case no AE communication', caseId__c= item.Id));
        }
    }
    EventBus.publish(messages);
}