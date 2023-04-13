import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Constants/values.dart';
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

    return ModalProgressHUD(
      inAsyncCall: mainProvider.showProgress,
      progressIndicator: const CircularProgressIndicator(color: kDarkBlue),
      child: GestureDetector(
        onTap: () =>
            mainProviderFalse.focusChange(focus: FocusNode(), context: context),
        child: Scaffold(
          backgroundColor: kBlack,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kBlack,

            ///Back Button
            leading: IconButton(
              icon: SvgPicture.asset(kBackArrow, height: 16),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
