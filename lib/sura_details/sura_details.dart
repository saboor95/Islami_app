import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:islami_app1/sura_details/aya.dart';

class SuraDetailsScreen extends StatefulWidget {
 static const String routeName='sura_Details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
 List<String> ayaat=[];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args=ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if(ayaat.isEmpty){
      loadFile(args.index);
    }
    return Stack(
      children: [
      Image.asset('assets/images/main_backgroud.png',
      fit:BoxFit.fitWidth,width:double.infinity,),
    Scaffold(
    appBar: AppBar(
    title: Text(args.suraName,style: Theme.of(context).textTheme.headline1,),
    ),
      body:ayaat.length==0?
          Center(child: CircularProgressIndicator()):
    Container(
      decoration: BoxDecoration(color: Colors.grey.shade100,
          border: Border.all(color: MyThemeData.colorGold,width: 2),
          borderRadius: BorderRadius.all(Radius.circular(25),
          )),
      margin: EdgeInsets.symmetric(horizontal: 25,vertical: 30),
      child: ListView.separated(
        separatorBuilder:(c,index) {
          return Divider(
            color: MyThemeData.colorGold,
            indent: 30,
            endIndent: 30,);
        },
            itemCount: ayaat.length,
            itemBuilder: (c,index){
          return aya_Item(ayaat[index]);}),
    ),

    )]);
  }

  void loadFile(int index)async{
   String content=await rootBundle.loadString('assets/files/${index+1}.txt');
   List<String> lines=content.split('\n');
   ayaat=lines;
   setState(() {
   });
  }
}
class SuraDetailsArgs{
  String suraName;
  int index;
  SuraDetailsArgs(this.suraName,this.index);
}