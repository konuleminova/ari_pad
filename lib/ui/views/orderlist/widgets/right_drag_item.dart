import 'dart:async';

import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/services/orderList_service.dart';
import 'package:ari_pad/ui/views/orderlist/widgets/timer_widget.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ari_pad/utils/size_config.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RightDragItem extends HookWidget {
  Order order;
  var refresh;

  RightDragItem({this.order, this.refresh});

  @override
  Widget build(BuildContext context) {
    var isExpaned = useState<bool>(false);
    var id = useState<String>();
    var time = useState<String>();
    var keyRefresh = useState<UniqueKey>();
    ApiResponse<OrderListResponse> apiResponse =
        useOrderList(keyRefresh.value, time: time.value, id: id.value);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 400), () {
        if (keyRefresh.value != null) {
          refresh();
        }
      });

      return () {};
    }, [keyRefresh.value]);
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                bottom: 8.toHeight, right: 4.toWidth, top: 16.toHeight),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                    bottom: BorderSide(
                        color: order.approved == '0'
                            ? Colors.lightBlue
                            : ThemeColor().yellowColor,
                        width: 2))),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    '${index + 1}. ${order.data[index].data.name}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.toFont),
                                  ),
                                  SizedBox(
                                    width: 16.toHeight,
                                  ),
                                  Expanded(
                                    child: Text(
                                        order.data[index].data.price + " ₼",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 12.toFont)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 4.toHeight,
                              ),
                              Container(
                                child: Text(
                                  order.data[index].data.information,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 10.toFont),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                width: SizeConfig().screenWidth / 3,
                                alignment: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              TimerText(
                                  dateText: order.dt,
                                  style: TextStyle(
                                      color: ThemeColor().yellowColor,
                                      fontSize: 12.toFont,
                                      fontWeight: FontWeight.w500)),
                              order.approved == '1'
                                  ? Text(order.finished_time,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12.toFont))
                                  : SizedBox(),
//                              order.approved=='1'? Text(
//                                  order.address,
//                                  style: TextStyle(
//                                      color: Colors.green,
//                                      fontSize: 12.toFont)):SizedBox(),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: order.data.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
                SizedBox(
                  height: 2.toHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      order.id ?? '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.toFont,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.toHeight,
                ),
                !isExpaned.value
                    ? Container(
                        height: 44.toHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: order.approved == '0'
                                            ? Colors.blue
                                            : order.time ==
                                                    ((index + 1) * 5).toString()
                                                ? Colors.blue
                                                : Colors.blue.withOpacity(0.3),
                                        child: Text(
                                          ((index + 1) * 5).toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      onTap: () {
                                        id.value = order.id;
                                        time.value =
                                            ((index + 1) * 5).toString();
                                        keyRefresh.value = new UniqueKey();
                                        // refresh();
                                      },
                                    );
                                  }),
                            ),
                            SizedBox(
                              width: 16.toWidth,
                            ),
                            Expanded(
                                child: InkWell(
                              child: Container(
                                width: 100.toWidth,
                                height: 44.toHeight,
                                // padding: EdgeInsets.all(3),
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 4.toWidth,
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Imtina',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.toWidth,
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                isExpaned.value = true;
                              },
                            ))
                          ],
                        ))
                    : Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                            left: 8.toWidth,
                            right: 8.toWidth,
                            bottom: 8.toWidth),
                        alignment: Alignment.bottomRight,
                        //   height: 54.toHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextField(style: TextStyle(color: Colors.black87)),
                            SizedBox(
                              height: 16.toHeight,
                            ),
                            InkWell(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 4.toWidth,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Imtina',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.toWidth,
                                  )
                                ],
                              ),
                              onTap: () {
                                isExpaned.value = false;
                              },
                            )
                          ],
                        ),
                      )
              ],
            )),
        Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 14.toFont,
              child: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
            ))
      ],
    );
  }
}
//"3TOMAT ŞORBASI \n1POLLO CON GORGONZOLA \n \n5 BRUSCHETTA",
