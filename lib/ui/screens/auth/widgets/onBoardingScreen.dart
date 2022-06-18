import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterquiz/utils/size_config.dart';

import '../../../../app/routes.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/constants.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_card.dart';
import '../../../widgets/default_background.dart';
import '../../../widgets/title_text.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int selectedIndex = 0;
  List<String> onBoarding = [
    'Create gamified quizzes becomes simple',
    'Find quizzes to test out your knowledge',
    'Take part in challenges with friends',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.67,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 9,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          selectedIndex = value;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: 60,
                            right: index == 0 ? 40 : 10,
                          ),
                          child: Image.asset(
                            Assets.onBoarding[index],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 15,
                            width: 15,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: selectedIndex == index
                                  ? Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    )
                                  : const Border.fromBorderSide(
                                      BorderSide.none,
                                    ),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                height: SizeConfig.screenHeight * 0.28,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 16,
                        left: 14,
                        right: 14,
                      ),
                      child: TitleText(
                        text: onBoarding[selectedIndex],
                        textColor: Colors.black,
                        weight: FontWeight.w500,
                        size: Constants.heading3,
                        align: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.signupoptions);
                        // Get.to(() => const SignUpOptions());
                      },
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 16,
                        bottom: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleText(
                            text: 'Already have an account? ',
                            size: Constants.bodyNormal,
                            textColor: Colors.grey,
                            weight: FontWeight.w400,
                          ),
                          InkWell(
                            onTap: () {
                              log('Login');
                              // Get.to(
                              //   () => const Login(),
                              // );

                              Navigator.of(context)
                                  .pushNamed(Routes.loginScreen);
                            },
                            child: TitleText(
                              text: 'Login',
                              size: Constants.bodyNormal,
                              textColor: Constants.primaryColor,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
