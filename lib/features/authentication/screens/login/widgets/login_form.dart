import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SLoginForm extends StatelessWidget {
  const SLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: SSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            //enter email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: STexts.email,
              ),
            ),
    
            const SizedBox(height: SSizes.spaceBtwInputFields),
    
            //enter password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: STexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
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
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(STexts.rememberMe),
                  ],
                ),
                //forget password
                TextButton(
                  onPressed: () {},
                  child: const Text(STexts.forgetPassword),
                ),
              ],
            ),
    
            const SizedBox(height: SSizes.spaceBtwSections),
    
            //sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(STexts.signIn),
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwItems),
            //create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(STexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
