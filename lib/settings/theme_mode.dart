import 'package:flutter/material.dart';
import 'package:islami_app1/provider/my_provider.dart';
import 'package:provider/provider.dart';


class ThemeModeBottomSheet extends StatelessWidget {
  const ThemeModeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: themeItem(context,'Light',provider),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              provider.changeThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: themeItem(context,'Dark',provider),
          ),
        ],
      ),
    )
    ;
  }
  Widget themeItem(BuildContext context,String text,MyProvider pro)=>Row(
  children: [
  Text(
  text,
  style: Theme.of(context).textTheme.headline1?.copyWith(color:
  (pro.mode==ThemeMode.light)?Theme.of(context).primaryColor:
Theme.of(context).colorScheme.secondary
  )),
  Spacer(),
  Icon(
  Icons.done,
  size: 30,color:(pro.mode==ThemeMode.light)?Theme.of(context).primaryColor:
  Theme.of(context).colorScheme.secondary ,
  ),
  ],
  );
}
