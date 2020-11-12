import 'package:ari_pad/business_logic/routes/nested_root.dart';
import 'package:ari_pad/business_logic/routes/route_names.dart';
import 'package:ari_pad/business_logic/routes/route_navigation.dart';
import 'package:ari_pad/business_logic/view_models/LoginViewModel.dart';
import 'package:ari_pad/ui/views/login/login.dart';
import 'package:ari_pad/utils/size_config.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/material.dart';

import 'views/home/home.dart';

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

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: ThemeColor().greyColor,
      body: NestedNavigator(
          navigationKey: navigationKey,
          initialRoute: '/login',
          routes: routeNames),
    );
  }
}
