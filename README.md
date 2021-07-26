# SalesforcePushNotifier
SalesforcePushNotifier is a lightweight apex based metadata to fire random personalized messages at regular intervals through REST requests to a third party Android/iOS app which displays the said messages as notifications on your phone.

## Why?
I was upskilling myself and gathered some good pace and went through quite a lot of new concepts. Unfortunately, I forgot how to apply most of them in about a week. Thus, I wanted to note down some points and be reminded of them regularly. If I could only think of a place where I go regularly to see these reminders. My phone of course!

I searched for many apps which would allow me to get my messages as notifications, fortunately I found many android apps using REST API to show up messages as notifications but unfortunately that was about all they did. So I decided to write my own code, after all, the only thing it needed was to fire HTTP requests at random.

**Maybe you might have a different use case. Maybe you want to be notified of personal stock market info. Maybe you want inspirational quotes sent to you. Your message, your needs**.

## How?
Being a Salesforce developer myself(not a good one :frowning_face:), I had everything I needed:
* An object to store personal text strings? Check.
* A class to fire HTTP requests? Check.
* An interface to schedule the requests? Check.


# Some Tech Stuff
## Alertzy
I have used an android app called [Alertzy](https://alertzy.app/), installed on my phone with a personal API key to display the notifications on my phone. There are several such apps and you can choose any of them.

## Quick Text
The messages are stored in the Salesforce "Quick Text" standard object. I found the existing standard fields to cover most of my functionality, although you could add custom fields as per your liking.

## Custom Setting
The API Key is stored in a hierarchical custom setting. This identifies a device to send push notification. If you are using multiple devices, you may change this to a list custom setting.

## Named Credentials
Named credentials are so important and powerful when working with callouts. No more of the remote site setting stuff.

## Scheduler
I have used a cron expression to schedule the callout for every 15 minutes of every day. It is in the .apex class. You may change it to your liking.

_I can think of some improvements to make which will be coming shortly. Also I'll be bundling this up in a 2nd Generation Unlocked package soon._

## How to use(Unpackaged Code)?
* Deploy the entire code to your developer edition sandbox. (If you don't have one, signup [here](https://developer.salesforce.com/signup))
* Install the [Alertzy](https://alertzy.app/) app on your mobile device. Copy the API key after the login.
* Paste this API key as an organization default in the Push_Notification custom setting.
* Copy the code from the PushNotificationScheduler.apex class and run it in the Execute Anonymous window in the Developer Console. (If you want only hourly notification, run only 1 line. If you want half hourly, run 2 lines. If you want quarterly, run all 4 lines)
