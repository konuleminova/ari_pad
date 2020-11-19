import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/hooks/use_callback.dart';
import 'package:ari_pad/services/services/orderList_service.dart';
import 'package:ari_pad/ui/common_widgets/error_handler.dart';
import 'package:ari_pad/ui/views/orderlist/order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ari_pad/utils/size_config.dart';

class OrderListViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<UniqueKey> keyRefresh1 = useState(UniqueKey());
    final ValueNotifier<UniqueKey> keyRefresh2 = useState(UniqueKey());
    final ValueNotifier<Map<String, bool>> acceptTarget =
        useState<Map<String, bool>>(Map<String, bool>());
    final ValueNotifier<int> indexState = useState(0);
    final ValueNotifier<ScrollController> listScrollController =
        useState(ScrollController());
    //Use fetch Order list
    ApiResponse<OrderListResponse> apiResponse =
        useOrderList(keyRefresh1.value);
    useMemoized(() {
      print('WAIITGNCOrders1 ${apiResponse?.data?.waitingOrders}');
      if (apiResponse.status == Status.Done) {
        apiResponse.data.waitingOrders.forEach((element) {
          acceptTarget.value[element.id] = false;
        });
        apiResponse.data.finishedOrders.forEach((element) {
          acceptTarget.value[element.id] = false;
        });
      }
    }, [apiResponse]);

    //On drag Started Callback
    final onDragStartCallBack = useCallback((int index) {
      indexState.value = index;
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
    }, [indexState.value]);

    //On Drag Accept CallBack
    useCallback(() {
      useChangeStatus(apiResponse?.data?.waitingOrders[indexState?.value].id,
          keyRefresh2.value);
    }, [keyRefresh2.value]);

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
      child: OrderListView(
          orderListResponse: apiResponse.data,
          acceptTarget: acceptTarget.value,
          onDragStartCallback: onDragStartCallBack,
          scrollController: listScrollController.value,
          onDragAcceptCallBack: onDragAcceptCallBack,
          onRefreshDataCallBack: onRefreshDataCallBack),
    );
  }
}
