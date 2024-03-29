import 'package:flutter/material.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:provider/provider.dart';
import '../provider/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          InkWell(
            onTap: (){
          provider.changeLanguage('en');
          Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  'English',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color:provider.languageCode=='en'?
                  MyThemeData.colorGold:MyThemeData.colorBlack),
                ),
                Spacer(),
                Icon(
                  Icons.done,
                  size: 30,
                  color: provider.languageCode=='en'?
                  MyThemeData.colorGold:MyThemeData.colorBlack,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  'Arabic',
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      color:provider.languageCode=='ar'?
                      MyThemeData.colorGold:MyThemeData.colorBlack ),
                ),
                Spacer(),
                Icon(
                  Icons.done,
                  size: 30,
                  color: provider.languageCode=='ar'?
                  MyThemeData.colorGold:MyThemeData.colorBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
