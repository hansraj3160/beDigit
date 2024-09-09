

import 'package:nexime/util/app_export.dart';

class PushNotificationService {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<String> initialise() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('FirebaseMessaging User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('FirebaseMessaging User granted provisional permission');
    } else {
      debugPrint(
          'FirebaseMessaging User declined or has not accepted permission');
    }

    // If you want to test the push notification locally,
    // you need to get the token and input to the Firebase console
    // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
    String token = await firebaseMessaging.getToken() ?? "";
    debugPrint("FirebaseMessaging token: $token");
    // if (Platform.isIOS) {
    //   await FirebaseMessaging.instance
    //       .setForegroundNotificationPresentationOptions(
    //     alert: true, // Required to display a heads up notification
    //     badge: true,
    //     sound: true,
    //   );
    // } else {
    //   const AndroidNotificationChannel channel = AndroidNotificationChannel(
    //     'high_importance_channel', // id
    //     'High Importance Notifications', // title
    //     importance: Importance.max,
    //   );

    //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    //       FlutterLocalNotificationsPlugin();

    //   await flutterLocalNotificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           AndroidFlutterLocalNotificationsPlugin>()
    //       ?.createNotificationChannel(channel);
    // }

    return token;
  }
}
