import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/ui/views/orderlist/widgets/left_drag_item.dart';
import 'package:ari_pad/ui/views/orderlist/widgets/right_drag_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ari_pad/utils/size_config.dart';

class OrderListView extends StatelessWidget {
  final OrderListResponse orderListResponse;
  Function(int index) changeStatus;
  Function onRefresh;
  ScrollController scrollController;
  Function onDragEnd;
  double scrollHeight;

  OrderListView(
      {this.orderListResponse,
      this.acceptTarget,
      this.changeStatus,
      this.scrollController,
      this.onDragEnd,
      this.scrollHeight,
      this.onRefresh});

  final Map<String, bool> acceptTarget;

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
                              height: 140.toHeight,
                              width: 140.toWidth,
                              color: Colors.black,
                              padding: EdgeInsets.all(16),
                            ),
                            onDragStarted: () {
                              changeStatus(index);
                            },
                            onDragEnd: (data) {
                              onDragEnd();
                              onRefresh();
                            },
                            child: !acceptTarget[
                                    orderListResponse.waitingOrders[index].id]
                                ? RightDragItem(
                                    order:
                                        orderListResponse.waitingOrders[index],
                                  )
                                : Container(),
                            data: acceptTarget[orderListResponse
                                .waitingOrders[index].id] as dynamic,
                          );
                        }),
                    color: Color(0xFF3F3F3F)),
              ),
              Expanded(
                  child: SingleChildScrollView(
                controller: scrollController,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: DragTarget<dynamic>(
                            builder: (BuildContext context,
                                List<dynamic> candidateData,
                                List<dynamic> rejectedData) {
                              return Column(
                                children: <Widget>[
                                  Expanded(
                                      //  maxHeight: 300.toHeight,
                                      child: ListView.separated(
                                          //controller: scrollController,
                                          //physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              child: LeftDragItem(
                                                order: orderListResponse
                                                    .finishedOrders[index],
                                              ),
                                              height: 140.toHeight,
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext contex,
                                                      int index) =>
                                                  Divider(),
                                          itemCount: orderListResponse
                                              .finishedOrders.length)),
                                  //                        SizedBox(height: 8.toHeight,),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 16.toHeight),
                                    height: scrollHeight,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.grey,
                                  )
                                ],
                              );
                            },
                            onWillAccept: (data) {
                              return true;
                            },
                            onAccept: (data) {
                              return true;
                            },
                          ),
                        ),

//                        SizedBox(height: 8.toHeight,),
//                        Container(
//                          margin: EdgeInsets.only(bottom: 16.toHeight),
//                          height: 100.toHeight,
//                          width: MediaQuery.of(context).size.width,
//                          color: Colors.grey,
//                        )
//                          Expanded(
//                            child: ListView.builder(
//                                controller: scrollController,
//                                itemCount:
//                                    orderListResponse.waitingOrders.length,
//                                itemBuilder: (BuildContext context, int index) {
//                                  return DragTarget<dynamic>(
//                                    builder: (BuildContext context,
//                                        List<dynamic> candidateData,
//                                        List<dynamic> rejectedData) {
//                                      return acceptTarget[orderListResponse
//                                              .waitingOrders[index].id]
//                                          ? LeftDragItem(
//                                              order: orderListResponse
//                                                  .waitingOrders[index],
//                                            )
//                                          : Container(
//                                              margin: EdgeInsets.only(
//                                                  bottom: 16.toHeight),
//                                              height: 200,
//                                              width: MediaQuery.of(context)
//                                                  .size
//                                                  .width,
//                                              color: Colors.grey,
//                                            );
//                                    },
//                                    onWillAccept: (data) {
//                                      return true;
//                                    },
//                                    onAccept: (data) {
//                                      changeStatus(index);
//                                      return true;
//                                    },
//                                  );
//                                }),
//                          )
                      ],
                    ),
                    color: Color(0xFF3F3F3F)),
              ))
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
