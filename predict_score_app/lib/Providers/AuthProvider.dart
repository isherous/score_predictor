import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool showSignInPassword = false;

  //final FirebaseAuth auth = FirebaseAuth.instance;
  // get isLoggedIn => auth.currentUser != null;
  //
  // get userId => auth.currentUser?.uid;
  //
  // get isEmailLoggedIn =>
  //     auth.currentUser?.providerData.first.providerId == "password";

  ///
  final signInEmailController = TextEditingController();
  final signInPasswordController = TextEditingController();

  ///
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpNameController = TextEditingController();

  ///
  final forgotEmailController = TextEditingController();

  ///
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  toggleShowSignInPassword() {
    showSignInPassword = !showSignInPassword;
    notifyListeners();
  }

  bool showSignUpPassword = false;
  toggleShowSignUpPassword() {
    showSignUpPassword = !showSignUpPassword;
    notifyListeners();
  }


  resetAll() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    forgotEmailController.clear();
  }

  //signOut() async => await auth.signOut();
}
