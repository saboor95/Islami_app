import 'package:flutter/material.dart';
import 'package:islami_app1/Home/ahadeth.dart';
import 'package:provider/provider.dart';
import '../provider/my_provider.dart';

class HadethDetails extends StatelessWidget {
 static const String routeName='hadethdetails';

  @override
  Widget build(BuildContext context) {
   var pro=Provider.of<MyProvider>(context);
    var args=ModalRoute.of(context)?.settings.arguments as HadethData;
    return Stack(
      children: [
        (pro.mode==ThemeMode.light)?Image.asset('assets/images/main_background.png',fit:BoxFit.fitWidth,width:double.infinity,):
        Image.asset('assets/images/dark_main_bg.png', fit:BoxFit.fitWidth,width:double.infinity,),
    Scaffold(
    appBar: AppBar(
    title
        : Text(args.title,
      style: Theme.of(context).textTheme.headline1,),
    ),
    body: Container(
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
      child: ListView.builder(
          itemCount: args.content.length,
          itemBuilder: (_,index){
        return Text(args.content[index],
        style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.center,);
      }),
    ),
    )]);
  }
}
