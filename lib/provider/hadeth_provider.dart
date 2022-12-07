import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Home/ahadeth.dart';

class HadethProvider extends ChangeNotifier{
  List <HadethData> Ahadeth=[];

  void loadHadethFile()async {
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> AllAhadeth = content.trim().split('#\r\n');
    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      List<String>hadethlines = hadeth.split('\n');
      String title = hadethlines[0];
      hadethlines.removeAt(0);
      HadethData hadethData = HadethData(title, hadethlines);
      Ahadeth.add(hadethData);
    }
      notifyListeners();
    }
  }