import 'package:ari_pad/business_logic/routes/nested_root.dart';
import 'package:ari_pad/business_logic/routes/route_names.dart';
import 'package:ari_pad/business_logic/routes/route_navigation.dart';
import 'package:ari_pad/utils/sharedpref/sp_util.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ari_pad/utils/size_config.dart';

class InitialView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ThemeColor().greyColor,
      body: Stack(
        children: [
          NestedNavigator(initialRoute: '/', routes: routeNames),
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            left: 0,
            right: 0,
            child: InkWell(
                onTap: () {
                  //  onRefreshDataCallBack();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 44,
                  ),
                  padding: EdgeInsets.only(
                      top: 4.toHeight, left: 8.toWidth, right: 0.toWidth),
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
                      Container(
                        child: Text(
                          SpUtil.getString('name surname') ?? "Name Surname",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        // width: 44.toWidth,
                        height: 50.toHeight,
                        alignment: Alignment.center,
                      ),
                      Row(
                        children: [
                          InkWell(
                            child: Container(
                              width: 44.toWidth,
                              height: 40.toHeight,
                              alignment: Alignment.center,
                              color: '0' == '0'
                                  ? ThemeColor().greyColor.withOpacity(0.6)
                                  : Colors.black,
                              child: Text(
                                'ON',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              //onOFFRestourantCallBack.call();
                            },
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            child: Container(
                              width: 44.toWidth,
                              height: 40.toHeight,
                              alignment: Alignment.center,
                              color: ThemeColor().greyColor.withOpacity(0.6),
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
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            child: Container(
                              width: 44.toWidth,
                              height: 40.toHeight,
                              alignment: Alignment.center,
                              color: ThemeColor().greyColor.withOpacity(0.6),
                              child: Text(
                                'Çıxarış',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              pushRouteWithName(ROUTE_REPORT);
                            },
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            child: Container(
                              width: 44.toWidth,
                              height: 40.toHeight,
                              alignment: Alignment.center,
                              color: ThemeColor().greyColor.withOpacity(0.6),
                              child: Text(
                                'Çıxış',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              SpUtil.remove('token');
                              pushReplaceRouteWithName('/');
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
