import 'package:flutter/material.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:islami_app1/provider/sura_details_provider.dart';
import 'package:islami_app1/sura_details/aya.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';


class SuraDetailsScreen extends StatelessWidget {
 static const String routeName='sura_Details';

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    return ChangeNotifierProvider(
      create: (context)=>SuraDetailsProvider()..loadFile(args.index),
      builder:(context,w){
        var provider = Provider.of<SuraDetailsProvider>(context);
        var pro=Provider.of<MyProvider>(context);
        return Stack(
            children: [
              (pro.mode==ThemeMode.light)?Image.asset('assets/images/main_backgroud.png',fit:BoxFit.fitWidth,width:double.infinity,):
        Image.asset('assets/images/dark_main_bg.png', fit:BoxFit.fitWidth,width:double.infinity,),
              Scaffold(
                appBar: AppBar(
                  title: Text(args.suraName,style: Theme.of(context).textTheme.headline1,),
                ),
                body:provider.ayaat.length==0?
                Center(child: CircularProgressIndicator()):
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
                  child: ListView.separated(
                      separatorBuilder:(c,index) {
                        return Divider(
                          color: MyThemeData.colorGold,
                          indent: 30,
                          endIndent: 30,);
                      },
                      itemCount: provider.ayaat.length,
                      itemBuilder: (c,index){
                        return aya_Item(provider.ayaat[index]);}),
                ),

              )]);
      },
    );
  }
}

class SuraDetailsArgs{
  String suraName;
  int index;
  SuraDetailsArgs(this.suraName,this.index);
}