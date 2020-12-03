import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/business_logic/routes/route_navigation.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/hooks/use_callback.dart';
import 'package:ari_pad/services/services/orderList_service.dart';
import 'package:ari_pad/ui/common_widgets/error_handler.dart';
import 'package:ari_pad/ui/views/orderlist/order_list.dart';
import 'package:ari_pad/utils/sharedpref/sp_util.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ari_pad/utils/size_config.dart';

class OrderListViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<UniqueKey> keyRefresh1 = useState();
    final ValueNotifier<UniqueKey> keyRefresh2 = useState();
    final ValueNotifier<Map<String, bool>> acceptTarget =
        useState<Map<String, bool>>(Map<String, bool>());
    final ValueNotifier<String> id = useState();
    final ValueNotifier<ScrollController> listScrollController =
        useState(ScrollController());

    //On Drag Accept CallBack
    useChangeStatus(id?.value, keyRefresh2?.value);

    //Use fetch Order list
    ApiResponse<OrderListResponse> apiResponse =
        useOrderList(keyRefresh1.value);

    useMemoized(() {
      if (apiResponse.status == Status.Error) {
      } else if (apiResponse.status == Status.Done) {
        apiResponse.data.waitingOrders.forEach((element) {
          acceptTarget.value[element.id] = false;
        });
        apiResponse.data.finishedOrders.forEach((element) {
          acceptTarget.value[element.id] = false;
        });
      }
    }, [apiResponse]);

    //On drag Started Callback
    final onDragStartCallBack = useCallback((String idWaitingOrder) {
      id.value = idWaitingOrder;
      listScrollController.value.animateTo(
          listScrollController.value.position.maxScrollExtent + 270.toHeight,
          curve: Curves.easeOut,
          duration: Duration(milliseconds: 500));
//      if (apiResponse.status == Status.Done) {
//        acceptTarget.value[apiResponse.data.waitingOrders[index].id] =
//            !acceptTarget.value[apiResponse.data.waitingOrders[index].id];
//
//        acceptTarget.notifyListeners();
//      }
      return () {};
    }, [id.value]);

    final onDragAcceptCallBack = useCallback(() {
      keyRefresh2.value = new UniqueKey();
    }, [keyRefresh2.value]);

//On refresh Data Callback
    final onRefreshDataCallBack = useCallback(() {
      keyRefresh1.value = new UniqueKey();
    }, [keyRefresh1.value]);
    // TODO: implement build
    return CustomErrorHandler(
      statuses: [apiResponse.status],
      errors: [apiResponse.error],
      child: apiResponse.status == Status.Done
          ? OrderListView(
              orderListResponse: apiResponse.data,
              acceptTarget: acceptTarget.value,
              onDragStartCallback: onDragStartCallBack,
              scrollController: listScrollController.value,
              onDragAcceptCallBack: onDragAcceptCallBack,
              onRefreshDataCallBack: onRefreshDataCallBack)
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Your account is used someone else.\nLog out and Login again..',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.toHeight,),
                InkWell(
                  child: Container(
                    width: 44.toWidth,
                    height: 44.toHeight,
                    alignment: Alignment.center,
                    color: ThemeColor().yellowColor.withOpacity(0.33),
                    child: Text(
                      'Çıxış',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    SpUtil.remove('token');
                    pushReplaceRouteWithName('/');
                  },
                )
              ],
            )),
    );
  }
}
