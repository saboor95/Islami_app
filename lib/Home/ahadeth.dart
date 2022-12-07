import 'package:flutter/material.dart';
import 'package:islami_app1/hadeth_details/hadeth_Details.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app1/provider/hadeth_provider.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class AhadethTab extends StatelessWidget {
  static const String routeName='ahadeth';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:  (context)=>HadethProvider()..loadHadethFile(),
      builder: (context,w){
        var provider = Provider.of<HadethProvider>(context);
        var pro=Provider.of<MyProvider>(context);
        return Container(
          width: double.infinity,
          child: Column(
              children: [
                Image.asset('assets/images/ahadeh_main_bg.png'),
                Divider(color: MyThemeData.colorGold,thickness: 3,),
                Text(
                  AppLocalizations.of(context)!.ahadeth,
                  textAlign:TextAlign.center,
                   style: TextStyle(color:
                    (pro.mode==ThemeMode.light)?Theme.of(context).colorScheme.secondary:
                    Theme.of(context).colorScheme.onSecondary,fontSize: 25,fontWeight: FontWeight.bold)),
                Divider(color: MyThemeData.colorGold,thickness: 3,),
                provider.Ahadeth.isEmpty?Center(child: CircularProgressIndicator()) :
                Expanded(
                  child: ListView.separated(
                      separatorBuilder:(context,index)=>Divider(
                        color: MyThemeData.colorGold,
                      ) ,
                      itemCount: provider.Ahadeth.length,
                      itemBuilder: (c,iindex){
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, HadethDetails.routeName,
                                arguments: provider.Ahadeth[iindex] );
                          },
                          child: Text(provider.Ahadeth[iindex].title,
                            textAlign: TextAlign.center,style:TextStyle(color:
                            (pro.mode==ThemeMode.light)?Theme.of(context).colorScheme.secondary:
                            Theme.of(context).colorScheme.onSecondary,fontSize: 25,fontWeight: FontWeight.bold)),
                        );
                      }),
                )
              ]
          ),
        );
      },
    );
  }
}

class HadethData{
  String title;
  List<String>content;
  HadethData(this.title,this.content);
}