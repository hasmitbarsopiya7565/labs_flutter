import 'package:flutter/material.dart';
import 'package:labs/extensions/common_extensions.dart';
import 'package:labs/manager/preferences/preferences.dart';
import 'package:labs/manager/preferences/preferences_name.dart';
import 'package:labs/manager/rest/http_request_manager.dart';
import 'package:labs/utils/common.dart';
import 'package:labs/utils/labels.dart';
import 'package:labs/widgets/custom_toast.dart';
import 'package:labs/widgets/theme_button.dart';

import '../dialogs/loading.dart';
import '../manager/rest/api_manager.dart';
import '../navigation/routes.dart';
import '../utils/app_colors.dart';
import '../utils/my_font_style.dart';
import '../widgets/theme_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.gray,
        body: Padding(
          padding: const EdgeInsets.all(35),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Labels.emailId,
                  style: MyFontStyle.bold(fontSize: 20),
                ),
                10.height,
                ThemeTextField(
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  hint: Labels.enterYourEmailId,
                  fillColor: AppColors.white,
                  isBorder: false,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.email,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {},
                  ),
                  hintStyle: MyFontStyle.regular(
                      color: AppColors.primaryHintTextColor),
                  validator: (value) => _emailValidator(value),
                ),
                20.height,
                Text(
                  Labels.password,
                  style: MyFontStyle.bold(fontSize: 20),
                ),
                10.height,
                ThemeTextField(
                  isPassword: !isPasswordVisible,
                  controller: passwordController,
                  hint: Labels.enterYourEmailId,
                  fillColor: AppColors.white,
                  isBorder: false,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  hintStyle: MyFontStyle.regular(
                      color: AppColors.primaryHintTextColor),
                  validator: (value) => _passwordValidator(value),
                ),
                50.height,
                ThemeButton(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  onClick: () => _login(),
                  radius: 10,
                  text: Labels.login,
                  textStyle: MyFontStyle.bold(color: AppColors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _emailValidator(value) {
    if (value.isEmpty) {
      return Labels.pleaseEnterYourEmailId;
    } else if (!isValidEmail(value)) {
      return Labels.pleaseEnterValidEmailId;
    } else {
      return null;
    }
  }

  _passwordValidator(value) {
    if (value.isEmpty) {
      return Labels.pleaseEnterYourPassword;
    } else {
      return null;
    }
  }

  _login() {
    if (_formKey.currentState!.validate()) {
      removeFocus(context);
      Loading.show(context);
      ApiManger.instance.login(bodyData: {
        "params": {
          "username": emailController.text.trim().toString(),
          "password": passwordController.text.trim().toString()
        }
      }).then(
        (Map res) async {
          Loading.hide();
          if (res['status']) {
            Preferences.setString(
                key: Prefs.token, value: "${res['data']['token']}");
            RequestManager.setHeaderWithAuth(res['data']['token']);
            CustomToast.showToast(
                context: context,
                message: "Login Successfull",
                toastType: ToastTypes.success);
            Navigator.pushReplacementNamed(context, Routes.serviceScreen);
          } else {
            CustomToast.showToast(
                context: context,
                message: res['message'],
                toastType: ToastTypes.error);
          }
        },
      );
    }
  }
}
