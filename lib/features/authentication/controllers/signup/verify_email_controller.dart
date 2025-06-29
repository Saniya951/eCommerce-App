import 'dart:async';

import 'package:ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //verify email whenever screen appears & set auto redirect time
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAuthRedirect();
    super.onInit();
  }

  //send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      SLoaders.successSnackBar(
        title: 'Email sent.',
        message: 'Please check your inbox to verify your email.',
      );
    } catch (e) {
      SLoaders.errorSnackBar(title: 'oh Snap', message: e.toString());
    }
  }

  //timer to automatically redirect on email verification
  setTimerForAuthRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: SImages.successfullyRegisterAnimation,
            title: STexts.yourAccountCreatedTitle,
            subTitle: STexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  //manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: SImages.successfullyRegisterAnimation,
          title: STexts.yourAccountCreatedTitle,
          subTitle: STexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
