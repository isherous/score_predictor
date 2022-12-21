import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Providers/AuthProvider.dart';
import '../Providers/MainProvider.dart';

class BackButtonScaffold extends StatelessWidget {
  const BackButtonScaffold({Key? key, required this.title, this.child})
      : super(key: key);

  final String title;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Provider.of<MainProvider>(context).showProgress,
      child: Scaffold(
        backgroundColor: kBlack,
        // appBar: AppBar(
        //   backgroundColor: kLightBlack,
        //   elevation: 1,
        //   title: Text(title, style: k17SemiBold),
        //   centerTitle: true,
        // ),
        body: GestureDetector(
          onTap: () => Provider.of<AuthProvider>(context, listen: false)
              .focusChange(focus: FocusNode(), context: context),
          child: SafeArea(
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
