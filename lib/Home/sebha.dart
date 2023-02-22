import 'package:flutter/material.dart';
import 'package:islami_app1/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName='sebha';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List <String> items =
  [
    'سبحان الله',
    'الحمد لله',
    'لا حول ولا قوة الا بالله',
    'لا اله الا الله',
    'الله أكبر',
  ];
  String dropdownValue = 'سبحان الله';
  int numsebha = 0;
  int count = 1;
  String namesebha = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
          children: [
            Container(
                width: 250,
                height: 250,
                child: InkWell(
                    onTap: () {
                      addtasbeh(count);
                    },
                    child:(provider.mode==ThemeMode.light)?Image.asset('assets/images/sebha_main_bg.png'):
               Image.asset('assets/images/sebha_dark.png'))),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('عدد التسبيحات',
                style:
                TextStyle(color:(provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.secondary:
                Theme.of(context).colorScheme.onPrimary,
                    fontSize: 25),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 70,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color:(provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.primary:
                  Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(25)),
              child:
              Text('$numsebha', style: Theme
                  .of(context)
                  .textTheme
                  .headline1),
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: (provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.primary:
                  Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(25)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  dropdownColor:(provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.primary:
                  Theme.of(context).colorScheme.secondary,
                  alignment: Alignment.center,
                  value: dropdownValue,
                  items: <String>[
                    'سبحان الله',
                    'الحمد لله',
                    'لا حول ولا قوة الا بالله',
                    'لا اله الا الله',
                    'الله أكبر'
                  ]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value,
                        child:
                        Text(value, style: TextStyle(
                          color:(provider.mode==ThemeMode.light)?Theme.of(context).colorScheme.onPrimary:
                    MyThemeData.colorBlack,fontWeight: FontWeight.bold
                        ) ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 30,width: 60,),
          ]
      ),
    );
  }


  void addtasbeh(index) {
    numsebha++;
    if (numsebha == 34) {
      namesebha = items[index];
      numsebha = 0;
      count++;
    }
    if (namesebha == 'الله أكبر') {
      count = 0;
    }
    setState(() {});
  }
}

