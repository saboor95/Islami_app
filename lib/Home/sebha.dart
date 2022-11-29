import 'package:flutter/material.dart';
import 'package:islami_app1/my_theme.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName='sebha';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List <String> tasbeh =
  ['سبحان الله','الحمد لله','لا حول ولا قوة الا بالله','لا اله الا الله','الله أكبر',];

  int numsebha=0;
  int count=1;
  String namesebha='سبحان الله';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
              width: 250,
              height: 250,
              child: InkWell(
                  onTap: (){
                    addtasbeh(count);
                  },
                  child: Image.asset('assets/images/sebha_main_bg.png'))),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text('عدد التسبيحات',
                style:
                TextStyle(color: MyThemeData.colorBlack,
                    fontSize: 25),),
            ),
            SizedBox(height: 25,),
            Container(
              height: 70,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(183, 147, 95, 150),
                  borderRadius: BorderRadius.circular(25)),
              child:
              Text('$numsebha', style: Theme.of(context).textTheme.headline1),
            ),
         SizedBox(height: 30,),
          Container(
           height: 50,
           width: 250,
           alignment: Alignment.center,
           decoration: BoxDecoration(
           color: MyThemeData.colorGold,
           borderRadius: BorderRadius.circular(25)),
           child:
           Text('$namesebha', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
           ),
          SizedBox(height: 30,),
        ]
      ),
    );
  }


  void addtasbeh(index) {
    numsebha++;
    if(numsebha==33) {
      namesebha = tasbeh[index];
      numsebha = 0;
      count++;
    }
    if (namesebha == 'الله أكبر' ) {
      count = 0;
    }
    setState(() {
    });
  }
}