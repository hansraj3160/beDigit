
import 'app_export.dart';

class UIhelper {
  static EdgeInsets paddingHelper(BuildContext context,
          {double top = 0,
          double bottom = 0,
          double right = 0,
          double left = 0}) =>
      EdgeInsets.only(
        top: getHorizontalSize(context, top),
        left: getVerticalSize(context, left),
        right: getVerticalSize(context, right),
        bottom: getHorizontalSize(context, bottom),
      );

  static unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static BoxDecoration boxDecorationContainer(BuildContext context,
      {double? rounded = 8, Color? color}) {
    return BoxDecoration(
      color: color ?? ColorConstant.colorPrimary,
      border: Border.all(color: ColorConstant.colorPrimary),
      borderRadius: BorderRadius.circular(
        getSize(context, rounded ?? 5),
      ),
    );
  }
  static logoutUser() {
    final box = GetStorage();    
     box.remove(constStorageTokenKey);
      Get.offAllNamed(AppRoute.login);
  }
}
