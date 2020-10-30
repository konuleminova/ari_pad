import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeftDragItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF72D84B),
          height: 200,
          padding: EdgeInsets.all(16),
          child: Text(
            "3TOMAT ŞORBASI \n1POLLO CON GORGONZOLA \n \n5 BRUSCHETTA",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        Positioned(
            right: 0,top: 0,
            child: CircleAvatar(
              child: Icon(Icons.done,color: Colors.black,),
              backgroundColor: Color(0xFFFDCE26),
            ))
      ],
    );
  }
}
