import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightDragItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          height: 200,
          padding: EdgeInsets.all(16),
          child: Text(
            "3TOMAT ŞORBASI \n1POLLO CON GORGONZOLA \n \n5 BRUSCHETTA",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        Positioned(
            right: 0,top: 0,
            child: CircleAvatar(
              child: Icon(Icons.more_horiz,color: Colors.black,),
              backgroundColor: Colors.white,
            ))
      ],
    );
  }
}
