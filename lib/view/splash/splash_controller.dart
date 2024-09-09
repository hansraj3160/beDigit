

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
    

    animationController = AnimationController(
      duration: Duration(seconds: duration),
      vsync: this,
    );
    animationController.forward().whenCompleteOrCancel(() {
      if (!box.hasData(constStorageTokenKey)) {
         Get.offAllNamed(AppRoute.login);
      } else {
        Get.offAllNamed(AppRoute.dashboard);
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
