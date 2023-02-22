import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languageCode='en';
  ThemeMode mode=ThemeMode.light;

void changeLanguage(String lang){
  languageCode=lang;
  notifyListeners();
}

String getBackgroundImage(){
  if(mode==ThemeMode.light){
    return 'assets/images/main_background.png';
  }
  return 'assets/images/dark_main_bg.png';
}
void changeThemeMode(ThemeMode thememode){
  mode=thememode;
  notifyListeners();
}
}