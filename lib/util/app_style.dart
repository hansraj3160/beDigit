import 'app_export.dart';

class AppStyle {
  static TextStyle txtInterRegular(BuildContext context) {
    return TextStyle(
      color: ColorConstant.colorText,
      fontSize: getFontSize(
        context,
        14,
      ),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle txtInterMedium(BuildContext context) {
    return TextStyle(
      color: ColorConstant.colorText,
      fontSize: getFontSize(
        context,
        16,
      ),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle txtInterSemiBold(BuildContext context) {
    return TextStyle(
      color: ColorConstant.colorText,
      fontSize: getFontSize(
        context,
        18,
      ),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle txtInterBold(BuildContext context) {
    return TextStyle(
      color: ColorConstant.colorText,
      fontSize: getFontSize(
        context,
        18,
      ),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }
}
