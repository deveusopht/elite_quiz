import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../app/appLocalization.dart';
import '../../../app/routes.dart';
import '../../../utils/assets.dart';
import '../../../utils/constants.dart';
import '../../../utils/validators.dart';
import '../../../utils/widgets_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/default_layout.dart';
import '../../widgets/social_button.dart';
import '../../widgets/terms.dart';
import '../../widgets/title_text.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController edtEmail = new TextEditingController();
  TextEditingController edtPwd = new TextEditingController();
  TextEditingController edtCPwd = new TextEditingController();
  bool _obscureText = true, _obscureTextCn = true, isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Login',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SocialButton(
              textColor: Constants.black2,
              icon: Assets.google,
              background: Constants.white,
              onTap: () {},
              horizontalMargin: 16,
              verticalMargin: 24,
              text: 'Login with Google',
              showBorder: true,
            ),
            SocialButton(
              textColor: Constants.white,
              icon: Assets.facebook,
              background: Constants.facebookColor,
              onTap: () {},
              horizontalMargin: 16,
              verticalMargin: 16,
              text: 'Login with Facebook',
              showBorder: false,
            ),
            const CustomDivider(
              text: 'OR',
              verticalMargin: 24,
            ),
            WidgetsUtil.verticalSpace24,
            CustomTextField(
              controller: edtEmail,
              label: 'Email Address',
              textInputType: TextInputType.emailAddress,
              hint: AppLocalization.of(context)!
                      .getTranslatedValues('emailLbl')! +
                  "*",
              validator: (value) {
                return Validators.validateEmail(
                    value!,
                    AppLocalization.of(context)!
                        .getTranslatedValues('emailRequiredMsg')!,
                    AppLocalization.of(context)!
                        .getTranslatedValues('VALID_EMAIL'));
              },
              prefixIcon: Assets.mail,
            ),
            WidgetsUtil.verticalSpace16,

            //password field

            CustomTextField(
              hidetext: _obscureText,
              obscuringCharacter: "*",
              validator: (val) => val!.isEmpty
                  ? '${AppLocalization.of(context)!.getTranslatedValues('pwdLengthMsg')}'
                  : null,
              label: 'Password',
              hint:
                  AppLocalization.of(context)!.getTranslatedValues('pwdLbl')! +
                      "*",
              prefixIcon: Assets.password,
              suffixIcon: _obscureText ? Assets.eye : Assets.closeEye,
              onSuffixTap: () {
                _obscureText = !_obscureText;
                log('Suffix');
              },
            ),
            CustomButton(
              text: 'Login',
              onPressed: () => log('Login'),
            ),
            WidgetsUtil.verticalSpace24,
            InkWell(
              onTap: () => Navigator.of(context).pushNamed(Routes.loginScreen),
              child: TitleText(
                text: 'Forgot Password?',
                size: Constants.bodyNormal,
                textColor: Constants.primaryColor,
                weight: FontWeight.w500,
              ),
            ),
            WidgetsUtil.verticalSpace24,
            const Terms(),
            WidgetsUtil.verticalSpace24,
          ],
        ),
      ),
    );
  }
}
