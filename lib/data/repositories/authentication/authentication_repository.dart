import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/naviagtion_menu.dart';
import 'package:ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //called from main.dart an app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //function to show relevant screen
  //   void screenRedirect() async {
  //   await Future.delayed(const Duration(milliseconds: 500)); // Optional: smoother UX

  //   final user = _auth.currentUser;
  //   await user?.reload(); // always reload to refresh email verification status
  //   final refreshedUser = _auth.currentUser;

  //   final isFirstTime = deviceStorage.read('IsFirstTime') ?? true;

  //   if (refreshedUser != null) {
  //     if (refreshedUser.emailVerified) {
  //       Get.offAll(() => const NavigationMenu());
  //     } else {
  //       Get.offAll(() => VerifyEmailScreen(email: refreshedUser.email));
  //     }
  //   } else {
  //     if (isFirstTime) {
  //       await deviceStorage.write('IsFirstTime', false);
  //       Get.offAll(() => const OnBoardingScreen());
  //     } else {
  //       Get.offAll(() => const LoginScreen());
  //     }
  //   }
  // }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        //if user is logged in nd user email is verified then go to navigation screen
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //local storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      //if first time then go to login screen else open onboarding screen
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  //email,password signin
  //register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again!';
    }
  }

  //email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again!';
    }
  }

  //logut user
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again!';
    }
  }

  //login
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again!';
    }
  }

  //google sign in
  Future<UserCredential?> signInWithGoogle() async {
    try {
      //trigger authentication flow
      // final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignIn googleSignIn = GoogleSignIn.standard();
      final GoogleSignInAccount? userAccount = await googleSignIn.signIn();

      //get auth details from req
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //create new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //once sign in return usercredentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('something went wrong: $e');
      return null;
      // throw 'Something went wrong.Please try again!';
    }
  }

  //forget password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw SFirebaseAuthException(e.code).message;
    } on FirebaseAuthException catch (e) {
      throw SFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw SPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.Please try again!';
    }
  }
}
