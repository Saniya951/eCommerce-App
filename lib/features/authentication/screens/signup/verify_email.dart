import 'package:ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, //to remove back arrow on left top side
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.return_icon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(
                image: const AssetImage(SImages.deliveredEmailIllustration),
                width: SHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              //Title & subtitle
              Text(
                STexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Text(
                'saniya@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Text(
                STexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  //successSCreen requires attributes 
                  onPressed:
                      () => Get.to(
                        () => SuccessScreen(
                          image: SImages.staticSuccessIllustration,
                          title: STexts.yourAccountCreatedTitle,
                          subTitle: STexts.yourAccountCreatedSubTitle,
                          onPressed: () => Get.to(() => const LoginScreen()),
                        ),
                      ),
                  child: const Text(STexts.tContinue),
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(STexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
