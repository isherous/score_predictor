import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Constants/colors.dart';
import '../Constants/styles.dart';

class CommonServices {
  ///Toast
  showToast({
    required String text,
    required BuildContext context,
  }) async {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: kWhite.withOpacity(0.1),
      ),
      child: Text(
        text,
        style: k16Medium.copyWith(color: kWhite),
        textAlign: TextAlign.center,
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(milliseconds: 2500),
    );
  }

  ///Form Validator
  bool validateAndSave(GlobalKey<FormState> formKey) {
    final FormState? form = formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        return true;
      }
    }
    return false;
  }
}
