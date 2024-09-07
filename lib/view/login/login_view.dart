import 'package:nexime/util/app_style.dart';
import 'package:nexime/util/string_constant.dart';
import 'package:nexime/util/widget/default_button_widget.dart';
import 'package:nexime/util/widget/text_form_field_widget.dart';
import 'package:nexime/util/widget/validation_helper.dart';
import 'package:nexime/view/login/login_controller.dart';

import '../../util/app_export.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarEmptyWidget(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                
              
                Image.asset(
                  AssetsConstant.loginBg,
                                //  height: Get.height,
                                 fit: BoxFit.fitHeight,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Column(
                   
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsConstant.loginAva,
                            scale: 3.2,
                          ),
                        ],
                      ),
                      SizedBox(height: getVerticalSize(context, 3)),
                      Text(
                        "LOGIN ACCOUNT",
                        style: AppStyle.txtInterBold(context).copyWith(
                            color: ColorConstant.bgColor, fontSize: 28),
                      ),
                       SizedBox(
                        height: getVerticalSize(context, 8),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AssetsConstant.icLine,
                            scale: 2,
                          ),
                        ],
                      ),
                        SizedBox(
                       height: getVerticalSize(context, 8),
                      ),
                      TextFormFieldWidget(
                        padding: 0,
                        hintColor: ColorConstant.hintColor.withOpacity(0.4),
                        label: "",
                        hint: TextValue.hintEmail,
            
                        // enabled: false,
                        prefixIcon: Image.asset(
                          AssetsConstant.icEmail,
                          scale: 2,
                        ),
                        controller: controller.emailController,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s'))
                        ],
                        focusNode: controller.focusNodes[0],
                        validator: (value) {
                          if (ValidationHelper.validateEmail(value ?? "")
                              .isNotEmpty) {
                            return ValidationHelper.validateEmail(
                                value ?? "");
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormFieldWidget(
                        label: "",
                        hint: TextValue.hintPassword,
                        hintColor: ColorConstant.hintColor.withOpacity(0.4),
                        controller: controller.passwordController,
                        focusNode: controller.focusNodes[1],
                        obscure: controller.obscurePassword.value,
                        textInputAction: TextInputAction.done,
                        padding: 0,
                        prefixIcon: Image.asset(
                          AssetsConstant.icLock,
                          scale: 2,
                        ),
                        validator: (value) {
                          if (ValidationHelper.validatePassword(value ?? "")
                              .isNotEmpty) {
                            return ValidationHelper.validatePassword(
                                value ?? "");
                          } else {
                            return null;
                          }
                        },
                        icon: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            controller.obscurePassword.value =
                                !controller.obscurePassword.value;
                          },
                          splashRadius: 5,
                          icon: Icon(
                            controller.obscurePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: getSize(context, 20),
                            color: controller.focusNodes[1].hasFocus
                                ? ColorConstant.black
                                : ColorConstant.blueGray,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password",
                            style: AppStyle.txtInterMedium(context)
                                .copyWith(color: ColorConstant.bgColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(context, 20),
                      ),
                      DefaultButtonWidget(
                        buttonText: 'Sign in',
                        isLoading: controller.isLoading.value,
                        textColor: ColorConstant.bgColor,
                        onPressed: () {
                          UIhelper.unFocus();
                          Get.put(LoginController());
                          if (controller.formKey.currentState!.validate()) {}
                        },
                      ),
                      SizedBox(
                        height: getVerticalSize(context, 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: AppStyle.txtInterMedium(context)
                                .copyWith(
                                    color: ColorConstant.bgColor,
                                    fontSize: 15),
                          ),
                          SizedBox(
                            height: getHorizontalSize(context, 25),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up",
                              style: AppStyle.txtInterSemiBold(context)
                                  .copyWith(
                                      color: ColorConstant.colorPrimary),
                            ),
                          )
                        ],
                      ),
                       SizedBox(
                        height: getVerticalSize(context, 5),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(top: 8,
                                  child: Container(
                                    height: 1,
                                    width: Get.width,
                                    color:
                                        ColorConstant.bgColor.withOpacity(0.1),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "OR",
                                    style: AppStyle.txtInterRegular(context)
                                        .copyWith(
                                            color: ColorConstant.bgColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                       SizedBox(
                        height: getVerticalSize(context, 15),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorConstant.bgColor,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(children: [Text(
                                    "Sign in with Google",
                                    style: AppStyle.txtInterMedium(context)
                                        .copyWith(
                                            color: ColorConstant.hintColor),
                                  ),],),
                      ),
                       SizedBox(
                        height: getVerticalSize(context, 15),
                      ),
                       Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorConstant.bgColor,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(children: [Text(
                                    "Sign in with Facebook",
                                    style: AppStyle.txtInterMedium(context)
                                        .copyWith(
                                            color: ColorConstant.hintColor),
                                  ),],),
                      ),
                    ],
                  ),
                ),
            
              SizedBox(
                            height: getHorizontalSize(context, 25),
                          ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
