import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/data/user/user_repository.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/features/personalization/models/user_model.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //signup
  void signup() async {
    try {
      //loading
      SFullScreenLoader.openLoadingDialog(
        'In processing your information...',
        SImages.docerAnimation,
      );

      //internet conectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //form variable
      if (!signupFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy
      if (!privacyPolicy.value) {
        SLoaders.warningSnackBar(
          title: 'Accept Prviaacay Policy',
          message:
              'In oreder to create account you must read & Accept Privacy Policy & Terms of Use.',
        );
        return;
      }

      //register user in firebase & save details
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      //save authenticated user in firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      SFullScreenLoader.stopLoading(); // remove loader

      //success msg
      SLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created. Verify email to continue.',
      );

      //move to verify screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

      
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
