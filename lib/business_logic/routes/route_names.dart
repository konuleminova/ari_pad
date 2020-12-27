import 'package:ari_pad/business_logic/view_models/LoginViewModel.dart';
import 'package:ari_pad/business_logic/view_models/OrderListViewModel.dart';
import 'package:ari_pad/business_logic/view_models/ReportViewModel.dart';

const ROUTE_LOGIN = '/';
const ROUTE_REPORT = '/report';
final routeNames = {
// default rout as '/' is necessary!
  '/home': (context) => OrderListViewModel(),
  ROUTE_LOGIN: (context) => LoginViewModel(),
  ROUTE_REPORT: (context) => ReportViewModel()
};
