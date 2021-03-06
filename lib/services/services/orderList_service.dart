import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/services/api_helper/api_config.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/api_helper/dio_config.dart';
import 'package:ari_pad/services/hooks/useApiConfig.dart';
import 'package:ari_pad/services/hooks/useDioRequest.dart';
import 'package:ari_pad/utils/sharedpref/sp_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ApiResponse<OrderListResponse> useOrderList(UniqueKey key,
    {String time, String id}) {
  final ApiConfig apiConfig = useApiConfig();
  final DioConfig dioConfig = useMemoized(
      () => DioConfig<OrderListResponse>(
          path: apiConfig.ORDER_LIST(SpUtil.getString('token'), time, id),
          transformResponse: (Response response) =>
              OrderListResponse.fromJson(response.data)),
      [key]);

  ApiResponse<OrderListResponse> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}

ApiResponse<OrderListResponse> useChangeStatus(String id, UniqueKey key) {
  final ApiConfig apiConfig = useApiConfig();
  final DioConfig dioConfig = useMemoized(() {
    if (key == null)
      return null;
    else
      return DioConfig<OrderListResponse>(
          path: apiConfig.CHANGE_STATUS(SpUtil.getString('token'), id),
          transformResponse: (Response response) =>
              OrderListResponse.fromJson(response.data));
  }, [key]);
  ApiResponse<OrderListResponse> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}
