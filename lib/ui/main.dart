import 'package:ari_pad/ui/views/init.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Ipad',
      theme: ThemeData(
        fontFamily: 'Bitter-Light',
        accentColor: ThemeColor().greyColor,
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InitPage(),
    );
  }
}
