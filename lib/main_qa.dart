
import 'package:nexime/util/app_export.dart';

import 'my_app.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  const String flavor = 'qa';
  FlavorConfig.initialize(flavor);
    Get.put(SplashController());
  runApp(const MyApp());
}