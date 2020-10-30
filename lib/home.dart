import 'package:ari_pad/right_drag_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'left_drag_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
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
                        child: Column(
                          children: <Widget>[
                            RightDragItem(),
                            SizedBox(
                              height: 16,
                            ),
                            RightDragItem()
                          ],
                        ),
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
                            LeftDragItem(),
                            SizedBox(
                              height: 16,
                            ),
                            LeftDragItem()
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
        ));
  }
}
