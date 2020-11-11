import 'package:ari_pad/business_logic/routes/route_names.dart';


void pushRouteWithName(String name, {RouteArguments arguments}) {
  navigationKey.currentState.pushNamed(name, arguments: arguments);
}

class RouteArguments<T> {
  T data;

  RouteArguments({this.data});
}
