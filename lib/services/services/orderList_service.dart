import 'package:ari_pad/business_logic/models/OrderListResponse.dart';
import 'package:ari_pad/services/api_helper/api_config.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/api_helper/dio_config.dart';
import 'package:ari_pad/services/hooks/useApiConfig.dart';
import 'package:ari_pad/services/hooks/useDioRequest.dart';
import 'package:ari_pad/utils/sharedpref/prefence_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ApiResponse<OrderListResponse> useOrderList() {
  final ApiConfig apiConfig = useApiConfig();
  print(
    apiConfig.ORDER_LIST(PreferenceUtils.getString('token')),
  );
  final DioConfig dioConfig = useMemoized(() => DioConfig<OrderListResponse>(
      path: apiConfig.ORDER_LIST(''),
      transformResponse: (Response response) =>
          OrderListResponse.fromJson(response.data)));

  ApiResponse<OrderListResponse> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}
