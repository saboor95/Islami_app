import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app1/Home/Radio/radio_item.dart';
import 'package:islami_app1/Home/Radio/radio_response.dart';
import 'package:provider/provider.dart';
import '../../provider/my_provider.dart';
import 'package:http/http.dart' as http;

class RadioTab extends StatefulWidget {
  static const String routeName='radio';

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  var audioPlayer=AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var ScreenSize=MediaQuery.of(context).size;
    var provider=Provider.of<MyProvider>(context);
    return FutureBuilder<RadioResponse>(
      future: getRadios(),
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          var radios=snapshot.data?.radios??[];
          return Column(
            children: [
              Expanded(
                  flex:2 ,
                  child: Image.asset('assets/images/radio_image.png')),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics:PageScrollPhysics() ,
                  itemBuilder: (context, index) =>
                      Center(
                        child: SizedBox(
                            width: ScreenSize.width,
                            child: RadioItem(radio : radios[index],
                              audioPlayer:audioPlayer ,)),
                      ),
                  itemCount: radios.length,
                ),
              ),
            ],);
        }
        else if (snapshot.hasError) {
          return Text('${snapshot.hasError??''}');
        }
        else {
          return Center(child: CircularProgressIndicator(),);
        }
      });
  }

  Future<RadioResponse> getRadios()async{
    var uri= Uri.parse('https://mp3quran.net/api/v3/radios');
   var response=await http.get(uri);
   if (response.statusCode==200){
     var json=jsonDecode(response.body);
     return RadioResponse.fromJson(json);
   }else{
     throw Exception('Failed to load radios');
   }
  }
}