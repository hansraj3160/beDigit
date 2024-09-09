
import 'package:nexime/util/app_export.dart';


class ProfileView extends GetView<DashboardController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(body: Center(child:  SizedBox(width: 100,
      child: DefaultButtonWidget(
                        buttonText: 'Logout',
                        isLoading: controller.isLoading.value,
                        textColor: ColorConstant.bgColor,
                        onPressed: () {
                          UIhelper.unFocus();
                       
                           UIhelper.logoutUser();
                          //   controller. login();
                      
                        },
                      ),
    ), 
                              ),);
  }
}