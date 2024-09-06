import 'app_export.dart';

class AppStyle {
  static TextStyle txtRobotoRegular(BuildContext context) {
    return TextStyle(
      color: ColorConstant.colorText,
      fontSize: getFontSize(
        context,
        18,
      ),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle txtRobotoMedium(BuildContext context) {
    return TextStyle(
      color: ColorConstant.colorText,
      fontSize: getFontSize(
        context,
        18,
      ),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle txtRotoSemiBold(BuildContext context) {
    return TextStyle(
      color: ColorConstant.colorText,
      fontSize: getFontSize(
        context,
        18,
      ),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle txtRobotoBold(BuildContext context) {
    return TextStyle(
      color: ColorConstant.colorText,
      fontSize: getFontSize(
        context,
        18,
      ),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }
}
