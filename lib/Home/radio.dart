import 'package:flutter/material.dart';
import 'package:islami_app1/my_theme.dart';

class RadioTab extends StatelessWidget {
  static const String routeName='radio';

  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(color: MyThemeData.colorBlack,fontSize: 25),),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Padding(
               padding: const EdgeInsets.all(35),
               child: Icon(Icons.skip_previous,color: MyThemeData.colorGold,size: 35,),
             ),
              Padding(
                padding: const EdgeInsets.all(35),
                child:Icon(Icons.play_arrow,color: MyThemeData.colorGold,size: 60,),
              ),
              Padding(
                padding: const EdgeInsets.all(35),
                child: Icon(Icons.skip_next,color: MyThemeData.colorGold,size: 35,),
              ),
            ],),
          )
      ],),
    );
  }
}