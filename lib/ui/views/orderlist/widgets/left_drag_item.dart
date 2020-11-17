import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/utils/theme_color.dart';
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
            margin: EdgeInsets.only(bottom: 8.toHeight),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF72D84B),
            height: 140.toHeight,
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Text(
                    order.data,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 4.toHeight,
                ),
                Text(order.dt,
                    style: TextStyle(
                      color: ThemeColor().yellowColor,
                      fontSize: 14.toFont,
                    ))
              ],
            )),
        Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
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
//     "3TOMAT ŞORBASI \n1POLLO CON GORGONZOLA \n \n5 BRUSCHETTA",
