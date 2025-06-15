import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SSignupForm extends StatelessWidget {
  const SSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                //Expanded if the Row has multiple children and you want the TextFormField to take up the available horizontal space.
                //we want to 2 inputs rectangles in row hence use expanded
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: STexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: SSizes.spaceBtwInputFields),
              Expanded(
                //Expanded if the Row has multiple children and you want the TextFormField to take up the available horizontal space.
                //we want to 2 inputs rectangles in row hence use expanded
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: STexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: SSizes.spaceBtwInputFields),

          //username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: STexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwInputFields),

          //email
          TextFormField(
            decoration: const InputDecoration(
              labelText: STexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwInputFields),

          //phone number
          TextFormField(
            decoration: const InputDecoration(
              labelText: STexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwInputFields),

          //password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: STexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwInputFields),

          //term nd condition check box
          const TermsAndConditionCheckbox(),

          const SizedBox(height: SSizes.spaceBtwSections),

          //signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: ()=> Get.to(()=>const VerifyEmailScreen()),
              child: const Text(STexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
