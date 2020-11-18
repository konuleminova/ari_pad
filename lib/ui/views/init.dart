import 'package:ari_pad/business_logic/routes/nested_root.dart';
import 'package:ari_pad/business_logic/routes/route_names.dart';
import 'package:ari_pad/utils/sharedpref/prefence_util.dart';
import 'package:ari_pad/utils/size_config.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    PreferenceUtils.init();
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: ThemeColor().greyColor,
      body: NestedNavigator(
          navigationKey: navigationKey,
          initialRoute: '/',
          routes: routeNames),
    );
  }
}
