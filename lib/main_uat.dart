import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nexime/config/firebase_init.dart';
import 'package:nexime/config/flavor_config.dart';
import 'package:nexime/firebase_options.dart';
import 'package:nexime/my_app.dart';
import 'package:nexime/util/app_export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  const String flavor = 'uat';
  FlavorConfig.initialize(flavor);
    Get.put(SplashController());
  runApp(const MyApp());
}