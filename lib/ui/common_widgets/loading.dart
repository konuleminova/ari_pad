import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: CircularProgressIndicator(backgroundColor: ThemeColor().greenColor,),
    );
  }
}
