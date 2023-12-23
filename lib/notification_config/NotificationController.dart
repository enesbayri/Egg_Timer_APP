// ignore_for_file: file_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/ui_helper/ui_colorHelper.dart';

class NotificationController {
  static Future<void> initialize() async {
    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        "resource://drawable/notification_icon",
        [
          NotificationChannel(
              channelGroupKey: 'Egg_Timer',
              channelKey: 'Egg_timer',
              channelName: 'Yumurta Zamanlayıcı',
              channelDescription: 'Yumurta pişirme zamanı',
              defaultColor: ColorHelper.bgColor,
              ledColor: Colors.amber,
              importance: NotificationImportance.Max)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'Egg_Timer',
              channelGroupName: 'Egg Timer')
        ],
        debug: true);
  }

  static void notificationSetListeners (){
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
  }

  static void notificationPermission(){
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  static void sendNotification(title,body,bigImage){
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      id: 10,
      channelKey: 'Egg_timer',
      actionType: ActionType.Default,
      title: title,
      body: body,
      notificationLayout: NotificationLayout.BigPicture,
      bigPicture: 'asset://$bigImage',
      largeIcon: 'asset://assets/eggs/1024.png',
      
      
      
    ));
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
  }
}
