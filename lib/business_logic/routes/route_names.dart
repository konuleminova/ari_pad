import 'package:ari_pad/business_logic/view_models/LoginViewModel.dart';
import 'package:ari_pad/ui/views/home/home.dart';
import 'package:flutter/material.dart';

const ROUTE_LOGIN = '/login';
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
final routeNames = {
// default rout as '/' is necessary!
  '/': (context) => HomePage(),
  ROUTE_LOGIN: (context) => LoginViewModel(),
};
