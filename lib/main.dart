import 'package:flutter/material.dart';
import 'package:islami_app1/Home/home.dart';
import 'package:islami_app1/hadeth_details/hadeth_Details.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:islami_app1/sura_details/sura_details.dart';

void main (){
  runApp(myAppliction());
}
class myAppliction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      initialRoute: HomeScreen.routeName,
      routes:{
        HomeScreen.routeName:(context)=>HomeScreen(),
        SuraDetailsScreen.routeName:(context)=>SuraDetailsScreen(),
        HadethDetails.routeName:(context)=>HadethDetails(),
      },
      theme:MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}