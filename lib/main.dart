import 'package:flutter/material.dart';
import 'package:islami_app1/Home/home.dart';
import 'package:islami_app1/hadeth_details/hadeth_Details.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:islami_app1/provider/my_provider.dart';
import 'package:islami_app1/sura_details/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(ChangeNotifierProvider(
      create: (context)=>MyProvider(),
      child: myAppliction()));
}
class myAppliction extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(provider.languageCode),
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