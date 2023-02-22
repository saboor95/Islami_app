import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app1/Home/Radio/radio_response.dart';

class RadioItem extends StatefulWidget {
Radios radio;
AudioPlayer audioPlayer;
RadioItem({
  required this.radio,
  required this.audioPlayer
});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  var audioPlayer=AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.radio.name??'',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: play,
                icon: Icon(Icons.play_arrow_rounded)),
            IconButton(
                onPressed:pause,
                icon: Icon(Icons.pause_rounded))
          ],
        )
      ],
    );
  }
  void play()async{
    if(widget.radio.url != null) {
     await widget.audioPlayer.play(UrlSource(widget.radio.url!));
    }
  }

  void pause()async{
   await widget.audioPlayer.pause();
  }

}


