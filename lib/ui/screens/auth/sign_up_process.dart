import 'package:flutter/material.dart';

import '../../../../app/appLocalization.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/validators.dart';
import '../../../../utils/widgets_util.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/default_layout.dart';
import '../../widgets/title_text.dart';

class SignUpProcess extends StatefulWidget {
  SignUpProcess({Key? key}) : super(key: key);

  @override
  State<SignUpProcess> createState() => _SignUpProcessState();
}

class _SignUpProcessState extends State<SignUpProcess> {
  TextEditingController edtEmail = new TextEditingController();
  TextEditingController edtPwd = new TextEditingController();
  TextEditingController edtCPwd = new TextEditingController();
  bool _obscureText = true, _obscureTextCn = true, isLoading = false;

  PageController pageController = PageController();

  int selectedProcess = 0;

  List<String> signUpProcess = [];

  @override
  Widget build(BuildContext context) {
    signUpProcess = [
      AppLocalization.of(context)!.getTranslatedValues('signUpProcessIndex0')!,
      AppLocalization.of(context)!.getTranslatedValues('signUpProcessIndex1')!,
      AppLocalization.of(context)!.getTranslatedValues('signUpProcessIndex2')!,
    ];

    return DefaultLayout(
      title: signUpProcess[selectedProcess],
      child: Column(
        children: [
          WidgetsUtil.verticalSpace24,
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: signUpProcess.length,
              onPageChanged: (value) {
                setState(() {
                  selectedProcess = value;
                });
              },
              itemBuilder: (context, index) {
                return getTextField(index);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 8,
              right: 24,
            ),
            alignment: Alignment.centerRight,
            child: TitleText(
              text: '${selectedProcess + 1} of 3',
              size: Constants.bodyNormal,
              weight: FontWeight.w500,
              textColor: Constants.primaryColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Constants.primaryColor,
              ),
              value: (selectedProcess + 1) / 3,
              backgroundColor: Constants.primaryColor.withOpacity(0.3),
            ),
          ),
          WidgetsUtil.verticalSpace24,
          CustomButton(
            text: selectedProcess == 2 ? 'Sign Up' : 'Next',
            onPressed: () {
              if (selectedProcess != signUpProcess.length - 1) {
                selectedProcess++;
                pageController.animateToPage(
                  selectedProcess,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInCirc,
                );
              }
            },
          ),
          WidgetsUtil.verticalSpace24,
        ],
      ),
    );
  }

  Widget getTextField(int index) {
    if (index == 0) {
      return CustomTextField(
        controller: edtEmail,
        textInputType: TextInputType.emailAddress,
        validator: (val) => Validators.validateEmail(
            val!,
            AppLocalization.of(context)!
                .getTranslatedValues('emailRequiredMsg')!,
            AppLocalization.of(context)!.getTranslatedValues('VALID_EMAIL')),
        label: 'Email Address',
        hint:
            AppLocalization.of(context)!.getTranslatedValues('emailLbl')! + "*",
        prefixIcon: Assets.mail,
      );
    } else if (index == 1) {
      return CustomTextField(
        controller: edtPwd,
        hidetext: _obscureText,
        label: 'Password',
        hint: 'Your password',
        prefixIcon: Assets.password,
        suffixIcon: Assets.eye,
        onSuffixTap: () {},
      );
    } else {
      return CustomTextField(
        label: 'Username',
        hint: 'Your username',
        prefixIcon: Assets.person,
      );
    }
  }
}
