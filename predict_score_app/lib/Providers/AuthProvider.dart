import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Services/CommonServices.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  get isLoggedIn => auth.currentUser != null;

  get userId => auth.currentUser?.uid;

  get isEmailLoggedIn =>
      auth.currentUser?.providerData.first.providerId == "password";

  ///Sign In Screen
  final signInEmailController = TextEditingController();
  final signInPasswordController = TextEditingController();

  ///Sign Up Screen
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpNameController = TextEditingController();

  ///Edit Profile
  updateDisplayNameOfUser(String name) async {
    await auth.currentUser?.updateDisplayName(name);
  }

  ///Forgot Password Screen
  final forgotEmailController = TextEditingController();

  ///Change Password Screen
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  ///Phone Auth
  final phoneController = TextEditingController();
  final phoneNameController = TextEditingController();
  //final otpController = TextEditingController();

  bool showPhoneNameTextField = false;
  changeShowPhoneNameTextField(bool b) {
    showPhoneNameTextField = b;
    notifyListeners();
  }

  ///Getting the phone code from current country code
  String countryCode =
      WidgetsBinding.instance.window.locale.countryCode ?? "US";
  changeCountryCode(String code) {
    countryCode = code;
    notifyListeners();
  }

  ///OTP
  String? otp;
  changeOTP(String s) {
    otp = s;
  }

  ///
  String? _verificationId;

  final _commonServices = CommonServices();

  Future<bool> verifyPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      await auth.signInWithCredential(phoneAuthCredential);
      print(
          "Phone number automatically verified and user signed in: ${auth.currentUser?.uid}");
    };

    // ignore: prefer_function_declarations_over_variables
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      if (authException.code == 'invalid-phone-number') {
        _commonServices.showToast(
            text: "Invalid Phone Number", context: context);
      }
      print(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
    };

    // ignore: prefer_function_declarations_over_variables
    PhoneCodeSent codeSent =
        (String verificationId, int? forceResendingToken) async {
      print('Please check your phone for the verification code.');
      _verificationId = verificationId;
    };

    // ignore: prefer_function_declarations_over_variables
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      print("verification code: $verificationId");
      _verificationId = verificationId;
    };

    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      return true;
    } catch (e) {
      print("Failed to Verify Phone Number: $e");
      return false;
    }
  }

  Future<User?> signInWithPhoneNumber(
      {required String otp, required BuildContext context}) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId ?? "",
        smsCode: otp,
      );
      final User? user = (await auth.signInWithCredential(credential)).user;
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        _commonServices.showToast(text: "Invalid OTP", context: context);
      }
      return null;
    }
  }

  Timer? timer;
  Duration? duration;

  startTimer() {
    duration = const Duration(seconds: 60);
    timer = Timer.periodic(const Duration(seconds: 1), (i) {
      final seconds = duration!.inSeconds - 1;
      if (seconds < 0) {
        timer!.cancel();
      } else {
        duration = Duration(seconds: seconds);
        notifyListeners();
      }
    });
  }

  stopTimer() => timer?.cancel();

  bool get isTimerStopped => duration!.inSeconds == 0;

  ///SCREENS CLEARING

  clearSignInScreen() {
    signInEmailController.clear();
    signInPasswordController.clear();
  }

  clearSignUpScreen() {
    signUpNameController.clear();
    signInEmailController.clear();
    signInPasswordController.clear();
  }

  clearForgotPasswordScreen() {
    forgotEmailController.clear();
  }

  clearChangePasswordScreen() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  clearPhoneScreen() {
    phoneController.clear();
    phoneNameController.clear();
    otp = null;
    showPhoneNameTextField = false;
    //otpController.clear();
  }

  signOut() async => await auth.signOut();
}
