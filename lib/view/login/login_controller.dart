import 'package:nexime/util/constant.dart';

import '../../util/app_export.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}

class LoginController extends GetxController
    {
  // static values
  static String token = "";
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
 List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  var obscurePassword = true.obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
       emailController = TextEditingController();
    passwordController = TextEditingController();

  }



}
