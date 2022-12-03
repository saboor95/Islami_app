import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app1/hadeth_details/hadeth_Details.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadethTab extends StatefulWidget {
  static const String routeName='ahadeth';

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
List <HadethData> Ahadeth=[];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty)
    loadHadethFile();
    return Container(
      width: double.infinity,
      child: Column(
          children: [
          Image.asset('assets/images/ahadeh_main_bg.png'),
            Divider(color: MyThemeData.colorGold,thickness: 3,),
       Text(
         AppLocalizations.of(context)!.ahadeth,
         style: Theme.of(context).textTheme.subtitle1,textAlign:TextAlign.center,),
            Divider(color: MyThemeData.colorGold,thickness: 3,),
      Ahadeth.isEmpty?Center(child: CircularProgressIndicator()) :
      Expanded(
        child: ListView.separated(
          separatorBuilder:(context,index)=>Divider(
            color: MyThemeData.colorGold,
          ) ,
            itemCount: Ahadeth.length,
            itemBuilder: (c,iindex){
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, HadethDetails.routeName,
                  arguments: Ahadeth[iindex] );
            },
            child: Text(Ahadeth[iindex].title,style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,),
          );
        }),
      )
      ]
      ),
    );
  }

  void loadHadethFile()async{
   String content=await rootBundle.loadString('assets/files/ahadeth.txt');
  List<String> AllAhadeth= content.trim().split('#\r\n');
  for (int i=0;i<AllAhadeth.length;i++){
    String hadeth=AllAhadeth[i];
    List<String>hadethlines=hadeth.split('\n');
    String title= hadethlines[0];
    hadethlines.removeAt(0);
    HadethData hadethData=HadethData(title, hadethlines);
    Ahadeth.add(hadethData);
  }
  setState(() {
  });
  }
}
class HadethData{
  String title;
  List<String>content;
  HadethData(this.title,this.content);
}