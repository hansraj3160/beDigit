
import 'package:nexime/util/app_export.dart';
import 'package:nexime/util/app_style.dart';
import 'package:nexime/util/widget/validation_helper.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? label;
  final String? label2;
  final String? hint;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final TextInputType? keyboardType;
  final bool enabled;
  final int manxLines;
  final Widget? icon;
  final Widget? prefixIcon;
  final double padding;
  final TextCapitalization textCapitalization;
  final Color? hintColor;
  final bool? obscure;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final int? maxLength;
  final Widget? prefix;
  final Color? counterTextColor;
  final bool? dropdown;
  final double radius;

  const TextFormFieldWidget({
    Key? key,
    this.label,
    this.hint,
    required this.controller,
    required this.focusNode,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.dropdown,
    this.manxLines = 1,
    this.icon,
    this.padding = 22,
    this.textCapitalization = TextCapitalization.none,
    this.prefixIcon,
    this.hintColor,
    this.obscure,
    this.inputFormatters,
    this.textInputAction,
    this.onFieldSubmitted,
    this.maxLength,
    this.label2,
    this.prefix,
    this.counterTextColor,
    this.radius=6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   bool isDropdown=dropdown??enabled;
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: ColorConstant.border),
    );
    return Padding(
      padding: UIhelper.paddingHelper(context,
          top: 0, bottom: padding, right: 0, left: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != null
              ? Text(label!, style: AppStyle.txtInterRegular(context))
              : Container(),
          label2 != null
              ? Text(label2!,
                  style: AppStyle.txtInterMedium(context)
                      .copyWith(fontSize: getFontSize(context, 14)))
              : Container(),
          label != null
              ? SizedBox(
                  height: getVerticalSize(context, 10),
                )
              : Container(),
          TextFormField(
            enabled: enabled,
            autovalidateMode: focusNode.hasFocus
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            style: AppStyle.txtInterRegular(context),
            controller: controller,
            onChanged: onChanged,
            obscureText: obscure ?? false,
            textCapitalization: textCapitalization,
            inputFormatters: inputFormatters,
            validator: validator ??
                (value) {
                  if (value != null) {
                    if (ValidationHelper.validateRequired(value).isNotEmpty) {
                      return ValidationHelper.validateRequired(value);
                    } else {
                      return null;
                    }
                  }
                  return null;
                },
            focusNode: focusNode,
            maxLines: manxLines,
            maxLength: maxLength,
            cursorColor: ColorConstant.colorPrimary,
            textInputAction: textInputAction ?? TextInputAction.next,
            onFieldSubmitted: onFieldSubmitted ??
                (_) => FocusScope.of(context).requestFocus(),
            keyboardType: keyboardType,
            decoration: InputDecoration(
                constraints: BoxConstraints(
                    minHeight: getVerticalSize(context, 54),
                    maxHeight: getVerticalSize(context, 54 + 33)),
                isCollapsed: true,
                contentPadding: UIhelper.paddingHelper(context,
                    top: 15, bottom: 15, right: 0, left: 19),
                alignLabelWithHint: true,
                filled:enabled || isDropdown ,
                fillColor: ColorConstant.bgColor,
                prefixIcon: prefixIcon,
                prefix: prefix,
                suffixIconConstraints:
                    BoxConstraints(minWidth: getHorizontalSize(context, 30)),
                suffixIcon: enabled && icon == null
                    ? null
                    : IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FittedBox(child: icon
                                // ??
                                //     Icon(
                                //       Icons.arrow_drop_down_outlined,
                                //       color: ColorConstant.black900,
                                //     ),
                                ),
                          ],
                        ),
                      ),
                hintText: hint,
                hintStyle: AppStyle.txtInterRegular(context).copyWith(color: hintColor),
                errorStyle:
                    AppStyle.txtInterRegular(context).copyWith(
                  color: ColorConstant.errorColor,
                ),
                // labelStyle: AppStyle.txtLatoRegular14Bluegray300(context),
                errorBorder: outlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: ColorConstant.errorColor),
                ),
                focusedErrorBorder: outlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: ColorConstant.errorColor),
                ),
                focusedBorder: outlineInputBorder.copyWith(
                 
                  borderSide: const BorderSide(color: ColorConstant.colorPrimary, ),
                ),
                border: outlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: ColorConstant.colorPrimary),
                ),
                enabledBorder: outlineInputBorder,
                disabledBorder: outlineInputBorder,
                counterStyle: AppStyle.txtInterRegular(context)
                    .copyWith(
                        fontSize: getFontSize(context, 14),
                        color: counterTextColor ?? ColorConstant.gray)),
          ),
        ],
      ),
    );
  }
}
