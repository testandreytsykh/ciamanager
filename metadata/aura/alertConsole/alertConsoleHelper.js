/**
 * Created by new on 15.12.2017.
 */
({
    connectCometd: function (component) {
        var helper = this;

        // Configure CometD
        var cometdUrl = window.location.protocol + '//' + window.location.hostname + '/cometd/40.0/';
        var cometd = component.get('v.cometd');
        cometd.configure({
            url: cometdUrl,
            requestHeaders: {Authorization: 'OAuth ' + component.get('v.sessionId')},
            appendMessageTypeToURL: false
        });
        cometd.websocketEnabled = false;

        // Establish CometD connection
        console.log('Connecting to CometD: ' + cometdUrl);
        cometd.handshake(function (handshakeReply) {
            if (handshakeReply.successful) {
                console.log('Connected to CometD.');
                // Subscribe to platform event
                var newSubscription = cometd.subscribe('/topic/CaseUpdates',
                    function (platformEvent) {
                        console.log('Platform event received: ' + JSON.stringify(platformEvent));
                        helper.onReceiveNotification(component, platformEvent);
                    }
                );
                // Save subscription for later
                var subscriptions = component.get('v.cometdSubscriptions');
                subscriptions.push(newSubscription);
                component.set('v.cometdSubscriptions', subscriptions);
            }
            else
                console.error('Failed to connected to CometD.');
        });
    },
    disconnectCometd: function (component) {
        var cometd = component.get('v.cometd');

        // Unsuscribe all CometD subscriptions
        cometd.batch(function () {
            var subscriptions = component.get('v.cometdSubscriptions');
            subscriptions.forEach(function (subscription) {
                cometd.unsubscribe(subscription);
            });
        });
        component.set('v.cometdSubscriptions', []);

        // Disconnect CometD
        cometd.disconnect();
        console.log('CometD disconnected.');
    },
    onReceiveNotification: function (component, platformEvent) {
        console.log('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
        var helper = this;
        // Extract notification from platform event
        var message = {
            caseId: platformEvent.data.sobject.Id,
            message: platformEvent.data.sobject.field1__c
        };
        // Save notification in history
        var messages = component.get('v.messages');
        messages.push(message);
        component.set('v.messages', messages);
        // Display notification in a toast if not muted
    },
})