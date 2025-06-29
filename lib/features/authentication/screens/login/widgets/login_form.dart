import 'package:ecommerce/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce/naviagtion_menu.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SLoginForm extends StatelessWidget {
  const SLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SSizes.spaceBtwSections),
        child: Column(
          children: [
            //enter email
            TextFormField(
              controller: controller.email,
              validator: (value) => SValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: STexts.email,
              ),
            ),

            const SizedBox(height: SSizes.spaceBtwInputFields),

            //enter password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => SValidator.validatePassword(value),
                // validator: (value) => SValidator.validateEmptyText('',value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: STexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed:
                        () =>
                            controller.hidePassword.value =
                                !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: SSizes.spaceBtwInputFields / 2),

            //remember me & forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged:
                            (value) =>
                                controller.rememberMe.value =
                                    !controller.rememberMe.value,
                      ),
                    ),
                    const Text(STexts.rememberMe),
                  ],
                ),
                //forget password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(STexts.forgetPassword),
                ),
              ],
            ),

            const SizedBox(height: SSizes.spaceBtwSections),

            //sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(STexts.signIn),
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwItems),
            //create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: Text(STexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
