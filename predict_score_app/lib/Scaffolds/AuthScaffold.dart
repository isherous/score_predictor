import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Providers/AuthProvider.dart';
import '../Providers/MainProvider.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of<MainProvider>(context);
    MainProvider mainProviderFalse =
        Provider.of<MainProvider>(context, listen: false);

    AuthProvider authProviderFalse =
        Provider.of<AuthProvider>(context, listen: false);

    return ModalProgressHUD(
      inAsyncCall: mainProvider.showProgress,
      child: Scaffold(
        backgroundColor: kBlack,
        body: GestureDetector(
          onTap: () {
            authProviderFalse.focusChange(focus: FocusNode(), context: context);
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: child ?? const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
