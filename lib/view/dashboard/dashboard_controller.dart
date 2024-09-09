import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nexime/model/booking_model.dart';
import 'package:nexime/model/service_model.dart';
import 'package:nexime/service/push_notification_service.dart';
import 'package:nexime/util/constant.dart';
import 'package:nexime/view/dashboard/booking_view.dart';
import 'package:nexime/view/dashboard/home_view.dart';
import 'package:nexime/view/dashboard/invoice_view.dart';
import 'package:nexime/view/dashboard/profile_view.dart';

import '../../util/app_export.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
  }
}

class DashboardController extends GetxController {

   late TextEditingController searchController; 
   RxList<Booking>  recentBooking=<Booking> [].obs;
    RxList<ServiceModel>  servicesData=<ServiceModel> [].obs;
    
   RxList<Booking>  featuredCandidates=<Booking> [].obs;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
 List<FocusNode> focusNodes = [
    FocusNode(),
    
  ];

  // Define your screens
  List<Widget> screens() {
    return const [
      HomeScreen(),
      BookingView(),
      InvoiceView(),
      ProfileView(),
       ProfileView(),
    ];
  }
 // PageController to manage the PageView
  PageController pageController = PageController();

 final List<Map<String, dynamic>> bottomNavItems = [
    {
      "title": "Home",
      "icon": AssetsConstant.icHome,
      "pageIndex": 0,
    },
    {
      "title": "Booking",
      "icon": AssetsConstant.icBooking,
      "pageIndex": 1,
    },
      
    {
      "title": "Invoice",
      "icon": AssetsConstant.icInvoice,
      "pageIndex": 2,
    },
    {
      "title": "Profile",
      "icon": AssetsConstant.icUser,
      "pageIndex": 3,
    },
  ];
  // Keep track of the current page index
  RxInt selectedIndex = 0.obs;
  RxInt ids = 1.obs;
// Function to handle navigation tap
  void onItemTapped(int index) {
    
      selectedIndex.value = index;
  
    pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
       searchController = TextEditingController();
  recentBooking.value = constRecentBooking
    .map((bookingJson) => Booking.fromJson(bookingJson))
    .toList();
      featuredCandidates.value = constRecentBooking
    .map((bookingJson) => Booking.fromJson(bookingJson))
    .toList();
servicesData.value = constServices
    .map((services) => ServiceModel.fromJson(services))
    .toList();
notificationService();
  }

  //!   <------------------------------------------------Firebase--------------------------------------------->
  Future<void> notificationService() async {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    PushNotificationService().initialise();
    //! Handle messages when the app is in the background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    //! Handle messages when the app is in the foreground
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    listenNotification();
    //! Handle initial notification if the app was opened via a notification
    //!When the app is terminated, i.e., app is neither in foreground or background.
    final RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      onSelectNotification(initialMessage);
    debugPrint("if InitialMessage when app in backgroud");
      listenNotification();
    } else {
      debugPrint("else InitialMessage when app in backgroud");
    }
    //!When the app is in the background, but not terminated.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      onSelectNotification(message);
    });
  }
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await setupFlutterNotifications();
    listenNotification();
    debugPrint('Handling a background message ${message.messageId}');
    showFlutterNotification(message);
  }

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
      " 'high_importance_channel',", 'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
      enableVibration: true,
      enableLights: true,
      playSound: true);
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool isFlutterLocalNotificationsInitialized = true;

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.high,
        enableVibration: true,
        enableLights: true,
        playSound: true);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void listenNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint('Got a message whilst in the foreground!');
     
      var initializationSettingsAndroid =
          const AndroidInitializationSettings("@mipmap/ic_launcher");
      var initializationSettingsIOS = const DarwinInitializationSettings();
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS);
      //!when the app is in foreground state and you click on notification.

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) {
         debugPrint("opened via ${notificationResponse}");
          switch (notificationResponse.notificationResponseType) {
            case NotificationResponseType.selectedNotification:
              debugPrint(" NotificationResponseType.selectedNotification");
              onSelectNotification(message);
              break;
            case NotificationResponseType.selectedNotificationAction:
              debugPrint(" NotificationResponseType.selectedNotificationAction");
              // onSelectNotification(message);
              break;
          }
        },
      );
      String groupChannelName = 'NEXIME';
      String groupChannelDescription = 'NEXIME Notify';
      AndroidNotificationDetails firstNotificationAndroidSpecifics =
          AndroidNotificationDetails(
        message.notification?.body ?? "",
        groupChannelName,
       
        channelDescription: groupChannelDescription,
        importance: Importance.max,
        playSound: true,
        enableVibration: true,
        enableLights: true,
        priority: Priority.high,
      );
      DarwinNotificationDetails iosNotificatonDetail =
          const DarwinNotificationDetails();
      NotificationDetails firstNotificationPlatformSpecifics =
          NotificationDetails(
              android: firstNotificationAndroidSpecifics,
              iOS: iosNotificatonDetail);
      await flutterLocalNotificationsPlugin.show(
        1,
          message.notification?.title ?? "",
          message.notification?.body ?? "",
          firstNotificationPlatformSpecifics);
      if (message.notification != null) {
        debugPrint(
            'Message also contained a notification: ${message.notification?.title}');
      }
    });
    ids.value++;
  }

  onSelectNotification(RemoteMessage message) {
    if (message.data["response"] != null) {
     
     Get.offAllNamed(AppRoute.dashboard);
      
    }
  }

  void showFlutterNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              icon: "@mipmap/ic_launcher",
             
              playSound: true),
        ),
      );
    }
  }
}
