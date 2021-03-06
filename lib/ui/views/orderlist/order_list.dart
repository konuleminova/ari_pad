import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/business_logic/routes/route_names.dart';
import 'package:ari_pad/business_logic/routes/route_navigation.dart';
import 'package:ari_pad/business_logic/view_models/ReportViewModel.dart';
import 'package:ari_pad/ui/views/orderlist/widgets/left_drag_item.dart';
import 'package:ari_pad/ui/views/orderlist/widgets/right_drag_item.dart';
import 'package:ari_pad/utils/sharedpref/sp_util.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ari_pad/utils/size_config.dart';

class OrderListView extends StatelessWidget {
  final OrderListResponse orderListResponse;
  Function(String id) onDragStartCallback;
  ScrollController scrollController;
  Function onDragAcceptCallBack;
  Function onRefreshDataCallBack;
  Function onOFFRestourantCallBack;

  OrderListView(
      {this.orderListResponse,
      this.acceptTarget,
      this.onDragStartCallback,
      this.scrollController,
      this.onDragAcceptCallBack,
      this.onRefreshDataCallBack,
      this.onOFFRestourantCallBack});

  final Map<String, bool> acceptTarget;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: SizeConfig().screenHeight,
        width: SizeConfig().screenWidth,
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: SizeConfig().screenHeight,
                      width: SizeConfig().screenWidth,
                      margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      padding: EdgeInsets.all(20),
                      color: Color(0xFF616161),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: orderListResponse.waitingOrders.length,
                          padding: EdgeInsets.only(bottom: 80.toHeight),
                          itemBuilder: (BuildContext context, int index) {
                            return Draggable(
                              affinity: Axis.horizontal,
                              feedback: !acceptTarget[
                                      orderListResponse.waitingOrders[index].id]
                                  ? Container(
                                      child: RightDragItem(
                                        order: orderListResponse
                                            .waitingOrders[index],
                                        refresh: onRefreshDataCallBack,
                                      ),
                                      width: SizeConfig().screenWidth / 2.24,
                                    )
                                  : Container(),
                              onDragStarted: () {
                                onDragStartCallback(
                                    orderListResponse.waitingOrders[index].id);
                              },
                              child: !acceptTarget[
                                      orderListResponse.waitingOrders[index].id]
                                  ? RightDragItem(
                                      order: orderListResponse
                                          .waitingOrders[index],
                                      refresh: onRefreshDataCallBack,
                                    )
                                  : Container(),
                              data: acceptTarget[orderListResponse
                                  .waitingOrders[index].id] as dynamic,
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        child: DragTarget<dynamic>(
                          builder: (BuildContext context,
                              List<dynamic> candidateData,
                              List<dynamic> rejectedData) {
                            return Column(
                              children: <Widget>[
                                Expanded(
                                    child: ListView.separated(
                                        padding: EdgeInsets.only(
                                            bottom: 80.toHeight),
                                        controller: scrollController,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Container(
                                            child: LeftDragItem(
                                              order: orderListResponse
                                                  .finishedOrders[index],
                                            ),
                                            //  height: 140.toHeight,
                                          );
                                        },
                                        separatorBuilder:
                                            (BuildContext contex, int index) =>
                                                Divider(),
                                        itemCount: orderListResponse
                                            .finishedOrders.length)),
                                //                        SizedBox(height: 8.toHeight,),
                                Container(
                                  margin: EdgeInsets.only(bottom: 16.toHeight),
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
                            onDragAcceptCallBack();
                            onRefreshDataCallBack();
                            return true;
                          },
                        ),
                        color: Color(0xFF616161)),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 100,
              left: 0,
              right: 0,
              child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    padding: EdgeInsets.only(top: 24, left: 34, right: 16),
                    height: 100,
                    width: SizeConfig().screenWidth,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/ellipse.png',
                            ),
                            fit: BoxFit.cover)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: InkWell(
                              child: Container(
                                  height: 54,
                                  width: 100,
                                  margin: EdgeInsets.only(top: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        SpUtil.getString('name surname') ??
                                            "Name Surname",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      InkWell(
                                        child: Container(
                                          child: Icon(
                                            Icons.play_circle_filled,
                                            size: 28,
                                          ),
                                        ),
                                        onTap: () {
                                          pushRouteWithName(ROUTE_VIDEO_PLAYER);
                                        },
                                      ),
                                      SizedBox(
                                        width: 30.toWidth,
                                      ),
                                    ],
                                  ),
                                  // width: 44.toWidth,
                                  alignment: Alignment.topLeft),
                              onTap: () {
                                onRefreshDataCallBack();
                              },
                            )),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      child: Container(
                                        width: 44.toWidth,
                                        height: 40.toHeight,
                                        alignment: Alignment.center,
                                        color: orderListResponse.onoff == '0'
                                            ? ThemeColor()
                                                .greyColor
                                                .withOpacity(0.6)
                                            : Colors.black,
                                        child: Text(
                                          orderListResponse.onoff == '1'
                                              ? 'OFF'
                                              : 'ON',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      onTap: () {
                                        onOFFRestourantCallBack.call();
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      child: Container(
                                        width: 44.toWidth,
                                        height: 40.toHeight,
                                        alignment: Alignment.center,
                                        color: ThemeColor()
                                            .greyColor
                                            .withOpacity(0.6),
                                        child: Text(
                                          'Stoplist ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      onTap: () {
                                        pushRouteWithName(ROUTE_STOPLIST);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      child: Container(
                                        width: 44.toWidth,
                                        height: 40.toHeight,
                                        alignment: Alignment.center,
                                        color: ThemeColor()
                                            .greyColor
                                            .withOpacity(0.6),
                                        child: Text(
                                          '????xar????',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      onTap: () {
                                        pushRouteWithName(ROUTE_REPORT);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                      child: InkWell(
                                    child: Container(
                                      width: 44.toWidth,
                                      height: 40.toHeight,
                                      alignment: Alignment.center,
                                      color: ThemeColor()
                                          .greyColor
                                          .withOpacity(0.6),
                                      child: Text(
                                        '????x????',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    onTap: () {
                                      SpUtil.remove('token');
                                      pushReplaceRouteWithName('/');
                                    },
                                  )),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
