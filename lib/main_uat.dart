
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