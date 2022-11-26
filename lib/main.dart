import 'package:flutter/material.dart';
import 'package:islami_app1/home.dart';

void main (){
  runApp(myAppliction());
}
class myAppliction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes:{
        HomeScreen.routeName:(context)=>HomeScreen()
      },
    );
  }
}