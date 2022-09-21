import 'package:flutter/material.dart';

class MenuViewmodel extends ChangeNotifier {
  bool _isDrawerOpen = false;
  bool get isDrawerOpen => _isDrawerOpen;
  void get changeDrawerOpen {
    _isDrawerOpen = !_isDrawerOpen;
    notifyListeners();
  }
}
