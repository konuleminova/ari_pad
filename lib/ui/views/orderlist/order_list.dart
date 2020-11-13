import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/ui/views/orderlist/widgets/left_drag_item.dart';
import 'package:ari_pad/ui/views/orderlist/widgets/right_drag_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ari_pad/utils/size_config.dart';

class OrderListView extends StatelessWidget {
  OrderListResponse orderListResponse;

  OrderListView({this.orderListResponse});

  bool accepted1 = false;
  bool accepted2 = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(24),
                    child: ListView.builder(
                        itemCount: orderListResponse.waitingOrders.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Draggable(
                            feedback: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              color: Colors.black,
                              padding: EdgeInsets.all(16),
                            ),
                            child: !accepted1
                                ? RightDragItem(
                                    order:
                                        orderListResponse.waitingOrders[index],
                                  )
                                : Container(),
                            data: 1 as dynamic,
                          );
                        }),
                    color: Color(0xFF3F3F3F)),
              ),
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: <Widget>[
//                        Expanded(
//                          child: ListView.builder(
//                              itemCount:
//                                  orderListResponse.finishedOrders.length,
//                              itemBuilder: (BuildContext context, int index) {
//                                return LeftDragItem(
//                                  order:
//                                      orderListResponse.finishedOrders[index],
//                                );
//                              }),
//                        ),
                        SizedBox(
                          height: 8.toHeight,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: orderListResponse.waitingOrders.length,
                              itemBuilder: (BuildContext context, int index) {
                                return DragTarget<dynamic>(
                                  builder: (BuildContext context,
                                      List<dynamic> candidateData,
                                      List<dynamic> rejectedData) {
                                    return accepted1
                                        ? LeftDragItem(
                                            order: orderListResponse
                                                .waitingOrders[index],
                                          )
                                        : Container(
                                      margin: EdgeInsets.only(bottom: 16.toHeight),
                                      height: 200,
                                      width:
                                      MediaQuery.of(context).size.width,
                                      color: Colors.grey,
                                    );
                                  },
                                  onWillAccept: (data) {
                                    if (data == 1) {
                                      accepted1 = true;
                                    }
                                    return true;
                                  },
                                );
                              }),
                        )
                      ],
                    ),
                    color: Color(0xFF3F3F3F)),
              )
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 100,
          left: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 44),
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/ellipse.png',
                    ),
                    fit: BoxFit.cover)),
          ),
        )
      ],
    );
  }
}
