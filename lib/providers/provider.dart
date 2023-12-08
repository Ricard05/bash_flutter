import 'package:flutter/material.dart';

class GmailProvider with ChangeNotifier{
  String _gmail = "";

  String get gmail => _gmail;
  Future<void> setGmail({required String value1}) async {
    _gmail = value1;
    notifyListeners();
  }  
}