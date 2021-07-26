public with sharing class PushNotifier {
    public static void fireNotification() {
        //Retrieve a random notification
        QuickText notificationMessage = retrieveRandomNotification();

        if(notificationMessage != null) {
            //Publish notification through Alertzy
            publishNotification(notificationMessage);
        }
    }

    private static QuickText retrieveRandomNotification() {
        try {
            List<QuickText> notification = [SELECT Id, Message, Category, Name, Category__c, URL_Button__c FROM QuickText];

            if(!notification.isEmpty()) {
                return notification[Integer.valueOf(Math.random()*notification.size())];
            }
            else return null;
        }
        catch(Exception e) {
            System.debug(e.getMessage());
            return null;
        }
    }

    private static void publishNotification(QuickText notificationMessage) {
        try {
            String apiKey = Push_Notification__c.getOrgDefaults().API_Key__c;

            HttpRequest req = new HttpRequest();
            req.setEndpoint('callout:Alertzy/send?accountKey='+apiKey+'&title='+EncodingUtil.urlEncode(notificationMessage.Name,'UTF-8')+'&message='+EncodingUtil.urlEncode(notificationMessage.Message,'UTF-8')+'&buttons='+EncodingUtil.urlEncode(notificationMessage.URL_Button__c,'UTF-8'));
            req.setMethod('POST');
            HttpResponse response = new Http().send(req);
        }
        catch(Exception e) {
            System.debug(e.getMessage());
        }
    }
}