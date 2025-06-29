import 'package:ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SSignupForm extends StatelessWidget {
  const SSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                //Expanded if the Row has multiple children and you want the TextFormField to take up the available horizontal space.
                //we want to 2 inputs rectangles in row hence use expanded
                child: TextFormField(
                  controller: controller.firstName,
                  validator:
                      (value) =>
                          SValidator.validateEmptyText('First name', value),
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
                  controller: controller.lastName,
                  validator:
                      (value) =>
                          SValidator.validateEmptyText('Last name', value),
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
            controller: controller.username,
            validator:
                (value) => SValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: STexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwInputFields),

          //email
          TextFormField(
            controller: controller.email,
            validator: (value) => SValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: STexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwInputFields),

          //phone number
          TextFormField(
            validator: (value) => SValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
              labelText: STexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwInputFields),

          //password
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value) => SValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: STexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed:
                      () =>
                          controller.hidePassword.value =
                              !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye),
                ),
              ),
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
              onPressed: () => controller.signup(),
              child: const Text(STexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
