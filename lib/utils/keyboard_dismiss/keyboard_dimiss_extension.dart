import 'package:flutter/cupertino.dart';

extension KeyboardUtils on BuildContext {
  void dismissKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
