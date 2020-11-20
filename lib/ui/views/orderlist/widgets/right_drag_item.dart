import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ari_pad/utils/size_config.dart';

class RightDragItem extends StatelessWidget {
  Order order;

  RightDragItem({this.order});

  @override
  Widget build(BuildContext context) {
    int datTime = (DateTime.now().millisecondsSinceEpoch -
        DateTime.parse(order.dt).millisecondsSinceEpoch);
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 8.toHeight),
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            height: 140.toHeight,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              order.data[index].data.name,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.toFont),
                            ),
                            SizedBox(
                              width: 16.toHeight,
                            ),
                            Expanded(
                              child: Text(order.data[index].data.price + " ₼",
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
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 12.toFont),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                          width: SizeConfig().screenWidth / 3,
                          alignment: Alignment.topLeft,
                        )
                      ],
                    );
                  },
                  itemCount: order.data.length,
                )),
                SizedBox(
                  height: 8.toHeight,
                ),
                Text(
                  DateTime.parse(order.dt).toString(),
                  style: TextStyle(
                    color: ThemeColor().yellowColor,
                    fontSize: 14.toFont,
                  ),
                )
              ],
            )),
        Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
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
