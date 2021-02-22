import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ari_pad/utils/size_config.dart';

class LeftDragItem extends StatelessWidget {
  Order order;

  LeftDragItem({this.order});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                bottom: 8.toHeight, top: 16.toHeight, right: 4.toWidth),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF72D84B).withOpacity(double.parse(order.opacity)),
            // height: 140.toHeight,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      child: Text(
                        '#${order.id} ${order.payedsum??""}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.toFont,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Text(
                      '${order.payedsum??''}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.toFont,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: 8,
                          ),
                          Text(order.username,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black, fontSize: 12.toFont,)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: Text(order.data[index].data.price + " ₼",
                                style: TextStyle(
                                    fontSize: 12.toFont, color: Colors.green)),
                          ),
                          SizedBox(
                            width: 8.toHeight,
                          ),
                          Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Text(
                                    '${order.data[index].count}x ${order.data[index].data.name}',
                                    // overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11.toFont,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 22),
                                    child: Text(
                                      order.data[index].data.information,
                                      style: TextStyle(
                                          fontSize: 10.toFont,
                                          color: Colors.green),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                              )),
                          SizedBox(
                            width: 4.toHeight,
                          ),
                        ]);
                  },
                  itemCount: order.data.length,
                ),
                SizedBox(
                  height: 4.toHeight,
                ),
                Container(
                  child: Text(
                    order.dt ?? "",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.toFont,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  width: SizeConfig().screenWidth,
                )
              ],
            )),
        Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 10.toFont,
              child: Icon(
                Icons.done,
                color: Colors.black,
              ),
              backgroundColor: Color(0xFFFDCE26),
            ))
      ],
    );
  }
}
