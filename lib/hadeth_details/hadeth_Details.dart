import 'package:flutter/material.dart';
import 'package:islami_app1/Home/ahadeth.dart';
import 'package:islami_app1/my_theme.dart';

class HadethDetails extends StatelessWidget {
 static const String routeName='hadethdetails';

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as HadethData;
    return Stack(
      children: [
      Image.asset('assets/images/main_backgroud.png',
      fit:BoxFit.fitWidth,width:double.infinity,),
    Scaffold(
    appBar: AppBar(
    title
        : Text(args.title,
      style: Theme.of(context).textTheme.headline1,),
    ),
    body: Container(
      decoration: BoxDecoration(color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: MyThemeData.colorGold,width: 2)
      ),
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
