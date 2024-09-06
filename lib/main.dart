import 'package:lnh_doctor/util/flavor.dart';

import 'util/app_export.dart';

void main() {
  const String flavor = String.fromEnvironment('FLAVOR');
  FlavorConfig.initialize(flavor);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowMaterialGrid: true,
      builder: ((context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              // textScaler: const TextScaler.linear(1),
              alwaysUse24HourFormat: true), //set desired text scale factor here
          child: child ?? Container(),
        );
      }),
      initialRoute: AppRoute.initial,
      getPages: AppRoute.getPages,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 1),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorConstant.bgColor,
        ),
        useMaterial3: false,
      ),
    );
  }
}
