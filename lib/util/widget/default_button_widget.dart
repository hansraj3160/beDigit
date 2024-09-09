

import 'package:nexime/util/app_export.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget(
      {super.key, required this.buttonText,
      required this.onPressed,
      this.btnColor,
      this.textColor,
      this.isLoading = false,
      this.icon,
      this.height = 50,
      this.enable = true,
      this.fontSize = 18,
      this.colors});
  final String buttonText;
  final Function()? onPressed;
  final Color? btnColor;
  final Color? textColor;
  final bool isLoading;
  final Widget? icon;
  final double height;
  final bool enable;
  final double fontSize;
  final List<Color>? colors;
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(getSize(context, 32));
    return Container(
      width: double.infinity,
      height: getVerticalSize(context, height),
      decoration: BoxDecoration(
        color: enable ? null : ColorConstant.gray.withOpacity(.3),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 1.0],
            colors: colors ??
                [
                  btnColor ?? ColorConstant.colorPrimary,
                  btnColor ?? ColorConstant.colorPrimary,
                ]),
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.gray.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: enable
            ? isLoading
                ? () {}
                : onPressed
            : null,
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: enable
                ? isLoading
                    ? ColorConstant.colorPrimary.withOpacity(0.4)
                    : Colors.transparent
                : ColorConstant.colorPrimary.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            )),
        child: isLoading
            ? Center(
                child: SizedBox(
                height: getSize(context, 20),
                width: getSize(context, 20),
                child: CircularProgressIndicator(
                  color: ColorConstant.bgColor,
                  strokeWidth: getSize(context, 3),
                ),
              ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? Container(),
                  Text(buttonText,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.txtInterMedium(context)
                          .copyWith(fontSize: getFontSize(context, fontSize), color: textColor)),
                ],
              ),
      ),
    );
  }
}
