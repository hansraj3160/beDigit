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
                  image: AssetImage(AssetsConstant.splashBg))),
          child: FadeTransition(
            opacity: controller.animationController,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      AssetsConstant.splashBgAbstract,
                      height: 435,
                      fit: BoxFit.fitHeight,
                    )),
                Image.asset(
                  AssetsConstant.splashBgCurve,
                  scale: 2.1,
                ),
                Positioned(
                  top: -10,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AssetsConstant.splashPeop,
                    fit: BoxFit.fitWidth,
                    // height: 410,
                    width: Get.width,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        AssetsConstant.logo,
                        scale: 2.7,
                      ),
                      // SizedBox(height: getVerticalSize(context, 5)),
                      // Text(
                      //   TextValue.takeControlOfYourWater,
                      //   style: AppStyle.textgothamRegular(context),
                      // ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 500,
                  left: 0,
                  child: Opacity(
                    opacity: 0.6,
                    child: Image.asset(
                      AssetsConstant.splashPlus1,

                      scale: 2,
                      // height: 410,
                    ),
                  ),
                ),
                Positioned(
                  top: 580,
                  right: 0,
                  child: Opacity(
                    opacity: 0.6,
                    child: Image.asset(
                      AssetsConstant.splashPlus2,

                      scale: 2,
                      // height: 410,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      AssetsConstant.splashBottom,
                      height: 12,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
