import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:predict_score_app/Constants/styles.dart';
import 'package:provider/provider.dart';

import '../Constants/colors.dart';
import '../Providers/MainProvider.dart';

class BackButtonScaffold extends StatelessWidget {
  const BackButtonScaffold({
    Key? key,
    required this.title,
    this.child,
    this.fab,
  }) : super(key: key);

  final String title;
  final Widget? child;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of<MainProvider>(context);
    MainProvider mainProviderFalse =
        Provider.of<MainProvider>(context, listen: false);

    return ModalProgressHUD(
      inAsyncCall: mainProvider.showProgress,
      child: Scaffold(
        floatingActionButton: fab,
        backgroundColor: kBlack,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: kBorderBlack,
                offset: Offset(0, 2.0),
                blurRadius: 0.0,
              )
            ]),
            child: AppBar(
              backgroundColor: kBlack,
              elevation: 1,
              title: Text(title, style: k17Medium),
              centerTitle: true,
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () => mainProviderFalse.focusChange(
              focus: FocusNode(), context: context),
          child: SafeArea(
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
