import 'package:ecommerce/common/styles/spacing_style.dart';
import 'package:ecommerce/common/widgets/login_signup/home_divider.dart';
import 'package:ecommerce/common/widgets/login_signup/social_buttons.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              SSpacingStyle
                  .paddingWithAppBarHeight, //in common/styles/spacing_style.dart
          child: Column(
            children: [
              //Logo,title,subtitle
              const SLoginHeader(),

              //create form
              const SLoginForm(),

              //since divider nd footer can be reused hence files are under
              //common/widgets/login_signup
              //Divider
              SFormDivider(dividerText: STexts.orSignInWith.capitalize!),
              const SizedBox(height: SSizes.spaceBtwSections),

              //Footer
              const SSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


