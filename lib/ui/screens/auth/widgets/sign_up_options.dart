import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterquiz/ui/screens/auth/signUpScreen.dart';

import '../../../../app/routes.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/widgets_util.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/default_background.dart';
import '../../../widgets/default_layout.dart';
import '../../../widgets/social_button.dart';
import '../../../widgets/terms.dart';
import '../../../widgets/title_text.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      background: Assets.background1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WidgetsUtil.verticalSpace24,
          WidgetsUtil.verticalSpace16,
          Expanded(
            flex: 2,
            child: Column(
              children: [
                SizedBox(
                  width: 56,
                  height: 56,
                  child: Image.asset(
                    'assets/icons/light_icon.png',
                  ),
                ),
                WidgetsUtil.verticalSpace10,
                TitleText(
                  text: 'Queezy',
                  textColor: Constants.white,
                  size: Constants.heading3 - 2,
                  fontFamily: 'Nunito',
                  weight: FontWeight.w800,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                Assets.personsMeeting,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              child: Column(
                children: [
                  WidgetsUtil.verticalSpace16,
                  TitleText(
                    text: 'Login or Sign Up',
                    size: Constants.heading3,
                    weight: FontWeight.w500,
                  ),
                  WidgetsUtil.verticalSpace8,
                  Container(
                    margin: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: TitleText(
                      text:
                          'Login or create an account to take quiz, take part in challenge, and more.',
                      align: TextAlign.center,
                      size: Constants.bodyNormal,
                      textColor: Constants.grey2,
                      weight: FontWeight.w400,
                    ),
                  ),
                  CustomButton(
                      height: 56,
                      text: 'Login',
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.loginScreen);
                      }
                      // => Get.to(
                      //   () => const Login(),
                      // ),
                      ),
                  CustomButton(
                      height: 56,
                      backgroundColor: Constants.grey4,
                      text: 'Create Account',
                      textColor: Constants.primaryColor,
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.signupScreen);
                      }
                      // Get.to(
                      //   () => const SignUpScreen(),
                      // ),
                      ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    //  Get.to(
                    //   () => Navigation(),
                    // ),
                    child: TitleText(
                      text: 'Later',
                      textColor: Constants.grey2,
                      size: Constants.bodyNormal,
                      weight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
