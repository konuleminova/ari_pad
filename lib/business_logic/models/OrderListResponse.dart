import 'package:ari_pad/business_logic/models/RestourantResponse.dart';

class OrderListResponse extends RestourantResponse {
  List<Order> waitingOrders;
  List<Order> finishedOrders;

  OrderListResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    found = json['found'];
    restid = json['restid'];
    name = json['name'];
    coords = json['coords'];
    waitingOrders = listOrderFromJson(json['waiting_orders']);
    finishedOrders = listOrderFromJson(json['finished_orders']);
  }
}

class Order {
  String id;
  String restid;
  String data;
  String dt;
  String md5key;
  String finished;

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restid = json['restid'];
    data = json['data'];
    dt = json['dt'];
    md5key = json['md5key'];
    finished = json['finished'];
  }
}

listOrderFromJson(List<dynamic> orderList) =>
    List<Order>.from(orderList.map((e) => Order.fromJson(e)));
