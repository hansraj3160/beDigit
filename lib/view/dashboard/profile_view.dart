
import 'package:nexime/util/app_export.dart';
import 'package:nexime/util/app_style.dart';

class ProfileView extends GetView<DashboardController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(body: Center(child:  Text(
                                "Profile",
                                style: AppStyle.txtInterMedium(context)
                                    .copyWith(
                                        color: ColorConstant.black,
                                      ),
                              ),),);
  }
}