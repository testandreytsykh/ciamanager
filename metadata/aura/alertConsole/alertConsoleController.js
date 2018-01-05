/**
 * Created by new on 15.12.2017.
 */
({
    onCometdLoaded: function (component, event, helper) {
        console.log('COMETAAAA');
        var cometd = new org.cometd.CometD();
        component.set('v.cometd', cometd);
        if (component.get('v.sessionId') != null)
            helper.connectCometd(component);
    },
    onInit: function (component, event, helper) {
        // Disconnect CometD when leaving page
        window.addEventListener('unload', function (event) {
            helper.disconnectCometd(component);
        });

        var action = component.get('c.getAll');
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var cases = response.getReturnValue();
                var messages = [];
                for (var key in cases) {
                    if (cases[key].field1__c == true) {
                        messages.push({
                            message: 'Case no customer communication'+ cases[key].CaseNumber,
                            caseId: cases[key].Id
                        });
                    } else if (cases[key].field2__c == true) {
                        messages.push({
                            message: 'Case untouched' + cases[key].CaseNumber,
                            caseId: cases[key].Id
                        });
                    } else if (cases[key].field3__c == true) {
                        messages.push({
                            message: 'Case no AE communication' + cases[key].CaseNumber,
                            caseId: cases[key].Id
                        });
                    }
                }
                component.set('v.messages', messages);
                console.log(component.get('v.messages'));
            }
        });
        $A.enqueueAction(action);

        var action = component.get('c.getSessionId');
        action.setCallback(this, function (response) {
            if (component.isValid() && response.getState() === 'SUCCESS') {
                component.set('v.sessionId', response.getReturnValue());
                if (component.get('v.cometd') != null)
                    helper.connectCometd(component);
            }
            else
                console.error(response);
        });
        $A.enqueueAction(action);
    }
})