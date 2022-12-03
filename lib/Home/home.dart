import 'package:flutter/material.dart';
import 'package:islami_app1/Home/ahadeth.dart';
import 'package:islami_app1/Home/Quran/quran.dart';
import 'package:islami_app1/Home/radio.dart';
import 'package:islami_app1/Home/sebha.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/main_backgroud.png',
        fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appTitle,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: MyThemeData.colorBlack,
          unselectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/quran.png'),
                  size: 30,
                ),
                label: 'Quran',
                backgroundColor: MyThemeData.colorGold),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/sebha.png'),
                  size: 30,
                ),
                label: 'Sebha',
                backgroundColor: MyThemeData.colorGold),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/radio.png'),
                  size: 30,
                ),
                label: 'Radio',
                backgroundColor: MyThemeData.colorGold),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ahadeth.png'),
                  size: 30,
                ),
                label: 'Ahadeth',
                backgroundColor: MyThemeData.colorGold),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: 'Settings',backgroundColor: MyThemeData.colorGold,),
          ],
        ),
        body: tabs[currentIndex],
      ),
    ]);
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsTab()
  ];
}
