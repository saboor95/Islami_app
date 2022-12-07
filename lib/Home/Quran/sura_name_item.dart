import 'package:flutter/material.dart';
import 'package:islami_app1/sura_details/sura_details.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';

class SuraNameItem extends StatelessWidget {
  String name;
  int index;
  SuraNameItem(this.name,this.index);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,SuraDetailsScreen.routeName,
            arguments:SuraDetailsArgs(name, index));
      },
      child: Text(name,
        textAlign: TextAlign.center,
        style: TextStyle(color:(provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.secondary:
        Theme.of(context).colorScheme.onSecondary,fontSize: 25,fontWeight: FontWeight.bold)),
    );
  }
}
