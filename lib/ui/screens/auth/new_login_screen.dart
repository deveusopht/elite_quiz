import 'package:flutter/material.dart';
import ''

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
              label: 'Email Address',
              hint: 'Your email address',
              prefixIcon: Assets.mail,
            ),
            WidgetsUtil.verticalSpace16,
            CustomTextField(
              label: 'Password',
              hint: 'Your password',
              prefixIcon: Assets.password,
              suffixIcon: Assets.eye,
              onSuffixTap: () {
                log('Suffix');
              },
            ),
            CustomButton(
              text: 'Login',
              onPressed: () => log('Login'),
            ),
            WidgetsUtil.verticalSpace24,
            InkWell(
              onTap: () => Get.to(
                () => const ResetPassword(),
              ),
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
