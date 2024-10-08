

import '../../util/app_export.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
     Scaffold(
        appBar: const AppBarEmptyWidget(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: Get.height*0.97,
            decoration: BoxDecoration(image: DecorationImage(image:   AssetImage(AssetsConstant.loginBg),opacity: 0.9,alignment: Alignment.bottomCenter)),
            
            child: Form(
      key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Column(
                 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                
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
                    SizedBox(height: getVerticalSize(context, 10)),
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
                        if (ValidationHelper.validateRequired(value ?? "")
                            .isNotEmpty) {
                          return ValidationHelper.validateRequired(
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
                      
                        if (controller.formKey.currentState!.validate()) {
                          controller.loginService();
                        //   controller. login();
                        }
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
                      child: Row(children: [
                        
                        Image.asset(
                        AssetsConstant.icGoogle,
                        scale: 2,
                      ),
                      SizedBox(width: getHorizontalSize(context, 20),),
                        Text(
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
                      child: Row(children: [
                        Image.asset(
                        AssetsConstant.icFacebook,
                        scale: 2,
                      ),
                      
                      SizedBox(width: getHorizontalSize(context, 20),),
                        Text(
                                  "Sign in with Facebook",
                                  style: AppStyle.txtInterMedium(context)
                                      .copyWith(
                                          color: ColorConstant.hintColor),
                                ),],),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
