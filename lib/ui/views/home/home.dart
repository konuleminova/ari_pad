import 'package:ari_pad/ui/views/orderlist/widgets/left_drag_item.dart';
import 'package:ari_pad/ui/views/orderlist/widgets/right_drag_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  bool accepted1 = false;
  bool accepted2 = false;

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
                            Draggable(
                              feedback: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                color: Colors.black,
                                height: 200,
                                padding: EdgeInsets.all(16),
                              ),
                              child: !accepted1 ? RightDragItem() : Container(),
                              data: 1 as dynamic,
                              // -> data Draggable bring along
                              onDragEnd: (details) {
                                print(
                                    'wasAccepted: ${details.wasAccepted.toString()}');
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Draggable(
                              feedback: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                color: Colors.black,
                                height: 200,
                                padding: EdgeInsets.all(16),
                              ),
                              child: !accepted2 ? RightDragItem() : Container(),
                              data: 2 as dynamic,
                              // -> data Draggable bring along
                              onDragEnd: (details) {
                                print(
                                    'wasAccepted: ${details.wasAccepted.toString()}');
                              },
                            ),
                            // RightDragItem()
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
                            DragTarget<dynamic>(
                              builder: (BuildContext context,
                                  List<dynamic> candidateData,
                                  // List dynamic type of candidate data
                                  List<dynamic> rejectedData) {
                                return accepted1
                                    ? LeftDragItem()
                                    : Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.grey,
                                      );
                              },
                              onWillAccept: (data) {
                                print('onWillAccept: $data');
                                setState(() {
                                  if (data == 1) {
                                    accepted1 = true;
                                  }
                                });

                                return true;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            DragTarget<dynamic>(
                              builder: (BuildContext context,
                                  List<dynamic> candidateData,
                                  // List dynamic type of candidate data
                                  List<dynamic> rejectedData) {
                                return accepted2
                                    ? LeftDragItem()
                                    : Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.grey,
                                      );
                              },
                              onWillAccept: (data) {
                                print('onWillAccept: $data');
                                setState(() {
                                  if (data == 2) {
                                    accepted2 = true;
                                  }
                                });

                                return true;
                              },
                            ),
                            //LeftDragItem()
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
        )
    );
  }
}
