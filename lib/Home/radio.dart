import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class RadioTab extends StatelessWidget {
  static const String routeName='radio';

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      child:
      Column(
        children: [
        Container(
            margin: EdgeInsets.only(top: 40),
            child: Image.asset('assets/images/radio_image.png')),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Text('إذاعة القرآن الكريم',
              style: TextStyle(color: (provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.secondary:
              Theme.of(context).colorScheme.onSecondary,fontSize: 25),),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Padding(
               padding: const EdgeInsets.all(35),
               child: Icon(Icons.skip_previous, color: (provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.primary:
               Theme.of(context).colorScheme.secondary,size: 35,),
             ),
              Padding(
                padding: const EdgeInsets.all(35),
                child:Icon(Icons.play_arrow,color: (provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.primary:
                Theme.of(context).colorScheme.secondary,size: 60,),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Icon(Icons.skip_next,color: (provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.primary:
                Theme.of(context).colorScheme.secondary,size: 35,),
              ),
            ],),
          )
      ],),
    );
  }
}