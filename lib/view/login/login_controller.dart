

 
import 'package:nexime/model/user_model.dart';

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
    // var splashController = Get.find<SplashController>();
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
  
  final box = GetStorage();
  @override
  void onInit() {
    super.onInit();
       emailController = TextEditingController();
    passwordController = TextEditingController();

  }


  void loginService() {
    isLoading.value = true;

    var parameters = {
      constEmail: emailController.text,
      constPassword: passwordController.text,
    
    };
    ApiHelper()
        .post(url: ApiHelper.logIn, body: parameters,)
        .then((onValue) async {
      var response = AuthResponse.fromJson(onValue);

      if (response.statusCode == "OK") {

        ApiHelper().sendNotification(token,);
       parseToken(response.data.accessToken );
       
        Get.offAllNamed(AppRoute.dashboard);
        
      } else if (response.statusCode == "BadRequest") {
      Get.snackbar("Alert",'${response.userMessage}');
        
      }
    }, onError: (error) {
    Get.snackbar("Error",'$error');
    }).whenComplete(() {
      isLoading.value = false;
    });
  }

   parseToken(String accessToken) {
    ApiHelper.token = accessToken;
    debugPrint(ApiHelper.token);
   
  
 
    box.write(constStorageTokenKey, ApiHelper.token);

 
  }
}
