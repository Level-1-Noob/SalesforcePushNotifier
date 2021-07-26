public with sharing class PushNotifierScheduler implements Schedulable {
    public void execute (SchedulableContext SC) {
        pushNotification();
    }

    @future(callout=true)
    public static void pushNotification() {
        PushNotifier.fireNotification();
    }
}