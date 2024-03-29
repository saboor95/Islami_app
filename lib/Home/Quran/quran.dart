import 'package:flutter/material.dart';
import 'package:islami_app1/Home/Quran/sura_name_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import '../../provider/my_provider.dart';

class QuranTab extends StatelessWidget {
 static const String routeName='quran';
 List<String>sura_name=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
   ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
   ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
   ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
   ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
   ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
   ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
   ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
   ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
   "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      child:Column(children: [
        Image.asset('assets/images/quran_main_bg.png'),
        Divider(color: MyThemeData.colorGold,thickness: 3,),
        Text(AppLocalizations.of(context)!.sura_name
            ,textAlign:TextAlign.center,style: TextStyle(color:
            (provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.secondary:
        Theme.of(context).colorScheme.onSecondary,fontSize: 25,fontWeight: FontWeight.bold)),
        Divider(color: MyThemeData.colorGold,thickness: 3,),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context,index)=>Divider(
              color: MyThemeData.colorGold,
              endIndent: 25,
              indent: 25,
            ),
              itemCount: sura_name.length,
              itemBuilder:(_,index){
           return SuraNameItem(sura_name[index],index);
          }),
        )
      ],) ,
    );
  }
}

