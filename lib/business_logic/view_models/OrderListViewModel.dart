import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/services/orderList_service.dart';
import 'package:ari_pad/ui/common_widgets/error_handler.dart';
import 'package:ari_pad/ui/views/orderlist/order_list.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OrderListViewModel extends HookWidget {

  @override
  Widget build(BuildContext context) {
   final ApiResponse<OrderListResponse> apiResponse = useOrderList();
    // TODO: implement build
    return CustomErrorHandler(
      statuses: [apiResponse.status],
      child: OrderListView(
        orderListResponse: apiResponse.data,
      ),
    );
  }
}
