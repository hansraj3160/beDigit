

import 'my_app.dart';
import 'util/app_export.dart'; // Import the main app entry

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  const String flavor = 'dev';
  FlavorConfig.initialize(flavor);
    Get.put(SplashController());
  runApp(const MyApp());
}
