import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // TODO: implement onInit
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      SFullScreenLoader.openLoadingDialog(
        'Logging in...',
        SImages.docerAnimation,
      );

      //chack internet connectivtiy
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //remove loader
      SFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap...', message: e.toString());
    }
  }

  //google sign in
  Future<void> googleSignIn() async {
    try {
      SFullScreenLoader.openLoadingDialog(
        'Loggin you in...',
        SImages.docerAnimation,
      );

      //chack internet connectivtiy
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //remove loader
      SFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
