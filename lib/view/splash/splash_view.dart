

import '../../util/app_export.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AssetsConstant.splashBg))
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FadeTransition(
              opacity: controller.animationController,
              child: Stack(
                children: [
                  Image.asset(
                          AssetsConstant.splashBgCurve,
                          height: getVerticalSize(context, 130),
                        ),
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      AssetsConstant.splashBottom
                    )
                   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
