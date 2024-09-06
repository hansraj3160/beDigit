

import 'package:lnh_doctor/view/login/login_controller.dart';

import '../../util/app_export.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.bgColor,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(
      //       AssetsConstant.splashBg,
      //     ),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Scaffold(
        appBar: const AppBarEmptyWidget(),
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: UIhelper.paddingHelper(context, bottom: 20),
            child: FadeTransition(
              opacity: controller.animationController,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsConstant.logo,
                          height: getVerticalSize(context, 130),
                        ),
                        // SizedBox(height: getVerticalSize(context, 5)),
                        // Text(
                        //   TextValue.takeControlOfYourWater,
                        //   style: AppStyle.textgothamRegular(context),
                        // ),
                      ],
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Padding(
                  //     padding: UIhelper.paddingHelper(context,
                  //         top: 0, bottom: 20, right: 0, left: 0),
                  //     child: Obx(() {
                  //       return Text(
                  //         "${TextValue.version} ${controller.version}+${controller.buildNumber}",
                  //         style: AppStyle.txtPoppinsRegular14(context)
                  //             .copyWith(color: ColorConstant.black900),
                  //       );
                  //     }),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
