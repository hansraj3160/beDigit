import 'package:nexime/util/constant.dart';

import '../../util/app_export.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // static values
  static String token = "";
  var logger = Logger();

  late AnimationController animationController;
  late Animation<Offset> animation;
  int duration = 3;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    splashAnimation();
    appInfo();
  }

  void splashAnimation() {
    if (box.hasData(constEmail)) {
      token = box.read(constEmail);
    }

    animationController = AnimationController(
      duration: Duration(seconds: duration),
      vsync: this,
    );
    animationController.forward().whenCompleteOrCancel(() {
      if (!box.hasData(constEmail) || token.isEmpty) {
         Get.offAllNamed(AppRoute.login);
      } else {
        // Get.offAllNamed(AppRoute.homeScreen);
      }
    });
  }

  var version = "".obs;
  var buildNumber = "".obs;
  void appInfo() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version.value = packageInfo.version;
      buildNumber.value = packageInfo.buildNumber;
    });
  }
}
