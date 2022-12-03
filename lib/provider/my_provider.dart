import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languageCode='en';

void changeLanguage(String lang){
  if(languageCode==lang)return;
  languageCode=lang;
  notifyListeners();
}
}