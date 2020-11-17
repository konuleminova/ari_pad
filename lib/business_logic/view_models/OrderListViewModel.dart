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
    final ValueNotifier<Map<String, bool>> acceptTarget =
        useState<Map<String, bool>>(Map<String, bool>());
    final ValueNotifier<double> scrollHeight = useState(0.toHeight);
    final ValueNotifier<int> indexState = useState(0);
    final ValueNotifier<ScrollController> listScrollController =
        useState(ScrollController());
    ApiResponse<OrderListResponse> apiResponse = useOrderList();
    useMemoized(() {
      if (apiResponse.status == Status.Done) {
        apiResponse.data.waitingOrders.forEach((element) {
          acceptTarget.value[element.id] = false;
        });
        apiResponse.data.finishedOrders.forEach((element) {
          acceptTarget.value[element.id] = false;
        });
      }
    }, [apiResponse]);

    useCallback(() {
      useChangeStatus(apiResponse?.data?.waitingOrders[indexState?.value].id);
    }, [indexState]);

    final changeStatus = useCallback((int index) {
      indexState.value = index;
      if (apiResponse.status == Status.Done) {
        acceptTarget.value[apiResponse.data.waitingOrders[index].id] =
            !acceptTarget.value[apiResponse.data.waitingOrders[index].id];
        scrollHeight.value = scrollHeight.value + 100.toHeight;
        listScrollController.value.jumpTo(scrollHeight.value);
        acceptTarget.notifyListeners();
      }
      return () {};
    }, [apiResponse]);

    // TODO: implement build
    return CustomErrorHandler(
      statuses: [apiResponse.status],
      child: OrderListView(
        orderListResponse: apiResponse.data,
        acceptTarget: acceptTarget.value,
        changeStatus: changeStatus,
        scrollController: listScrollController.value,
      ),
    );
  }
}
