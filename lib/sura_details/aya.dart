import 'package:flutter/material.dart';

class aya_Item extends StatelessWidget {
 String aya;
 aya_Item(this.aya);

  @override
  Widget build(BuildContext context) {
    return Text(aya,style:Theme.of(context).textTheme.subtitle1?.copyWith(
letterSpacing: 0.25,
      fontStyle:FontStyle.italic,
    ),textAlign: TextAlign.center,
    );
  }
}
