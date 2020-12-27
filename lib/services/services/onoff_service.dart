import 'package:ari_pad/services/api_helper/api_config.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/api_helper/dio_config.dart';
import 'package:ari_pad/services/hooks/useApiConfig.dart';
import 'package:ari_pad/services/hooks/useDioRequest.dart';
import 'package:ari_pad/utils/sharedpref/sp_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ApiResponse<dynamic> useOnOff(UniqueKey uniqueKey) {
  final ApiConfig apiConfig = useApiConfig();
  DioConfig dioConfig = useMemoized(() {
    if (uniqueKey == null) {
      return null;
    }
    return DioConfig<dynamic>(
        path: apiConfig.ON_OFF(SpUtil.getString('token')),
        transformResponse: (Response response) {
          return response.data;
        });
  },[uniqueKey]);

  ApiResponse<dynamic> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}
