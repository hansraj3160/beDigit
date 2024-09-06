import '../../util/app_export.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(DashboardController());
  }
}

class DashboardController extends GetxController {}
