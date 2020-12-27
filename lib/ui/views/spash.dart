import 'package:ari_pad/business_logic/routes/nested_root.dart';
import 'package:ari_pad/business_logic/routes/route_names.dart';
import 'package:ari_pad/business_logic/routes/route_navigation.dart';
import 'package:ari_pad/ui/views/init/initial.dart';
import 'package:ari_pad/utils/sharedpref/sp_util.dart';
import 'package:ari_pad/utils/size_config.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/material.dart';

class SpashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SpashScreen> {
  String initial;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return InitialView();
  }

  @override
  void initState() {
    super.initState();
    setInstance();
  }

  void setInstance() async {
    await SpUtil.getInstance();
    initial = await SpUtil.getString('token').isEmpty ? null : "/home";
    if (initial != null) {
      pushReplaceRouteWithName('/home');
    }
  }
}
