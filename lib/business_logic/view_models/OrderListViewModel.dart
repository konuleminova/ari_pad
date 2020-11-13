import 'dart:io';

import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/hooks/use_callback.dart';
import 'package:ari_pad/services/services/orderList_service.dart';
import 'package:ari_pad/ui/common_widgets/error_handler.dart';
import 'package:ari_pad/ui/views/orderlist/order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OrderListViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Map<String, bool>> acceptTarget =
        useState<Map<String, bool>>(Map<String, bool>());
    final ApiResponse<OrderListResponse> apiResponse = useOrderList();

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

    final changeStatus = useCallback((int index) {
      if (apiResponse.status == Status.Done) {
        acceptTarget.value[apiResponse.data.waitingOrders[index].id] = true;
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
      ),
    );
  }
}
