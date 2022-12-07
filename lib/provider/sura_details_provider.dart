import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier{
  List<String> ayaat=[];

  get mode => null;
  void loadFile(int index)async{
    String content=await rootBundle.loadString('assets/files/${index+1}.txt');
    List<String> lines=content.split('\n');
    ayaat=lines;
    notifyListeners();
  }
}