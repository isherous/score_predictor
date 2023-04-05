import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int bottomBarIndex = 0;
  changeBottomBarIndex(int i) {
    bottomBarIndex = i;
    notifyListeners();
  }

  bool showProgress = false;
  changeShowProgress(bool b) {
    showProgress = b;
    notifyListeners();
  }

  focusChange({
    required FocusNode focus,
    required BuildContext context,
  }) {
    FocusScope.of(context).requestFocus(focus);
    notifyListeners();
  }

}
