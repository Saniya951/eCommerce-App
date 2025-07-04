import 'package:ecommerce/common/widgets/login_signup/home_divider.dart';
import 'package:ecommerce/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                STexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              //Form
              SSignupForm(),
              const SizedBox(height: SSizes.spaceBtwSections),

              //divider
              SFormDivider(dividerText: STexts.orSignUpWith.capitalize!),
              const SizedBox(height: SSizes.spaceBtwSections),
              
              //social icons
              const SSocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}

