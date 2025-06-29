import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/helpers/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      SFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        SImages.docerAnimation,
      );

      //chack internet connectivtiy
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      SFullScreenLoader.stopLoading();

      //success scren
      SLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email link is sent to Reset your password'.tr,
      );

      //redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      SFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        SImages.docerAnimation,
      );

      //chack internet connectivtiy
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      SFullScreenLoader.stopLoading();

      //success scren
      SLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email link is sent to Reset your password'.tr,
      );
    } catch (e) {
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
