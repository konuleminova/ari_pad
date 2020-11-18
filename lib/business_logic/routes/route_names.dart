import 'package:ari_pad/business_logic/view_models/LoginViewModel.dart';
import 'package:ari_pad/business_logic/view_models/OrderListViewModel.dart';
import 'package:ari_pad/ui/views/home/home.dart';
import 'package:ari_pad/ui/views/orderlist/order_list.dart';
import 'package:flutter/material.dart';

const ROUTE_LOGIN = '/';
final routeNames = {
// default rout as '/' is necessary!
  '/home': (context) => OrderListViewModel(),
  ROUTE_LOGIN: (context) => LoginViewModel(),
};
