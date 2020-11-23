import 'package:ari_pad/business_logic/view_models/LoginViewModel.dart';
import 'package:ari_pad/business_logic/view_models/OrderListViewModel.dart';

const ROUTE_LOGIN = '/';
final routeNames = {
// default rout as '/' is necessary!
  '/home': (context) => OrderListViewModel(),
  ROUTE_LOGIN: (context) => LoginViewModel(),
};
