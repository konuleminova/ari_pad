import 'package:ari_pad/business_logic/models/RestourantItem.dart';
import 'package:ari_pad/services/api_helper/api_config.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/api_helper/dio_config.dart';
import 'package:ari_pad/services/hooks/useApiConfig.dart';
import 'package:ari_pad/services/hooks/useDioRequest.dart';
import 'package:ari_pad/utils/sharedpref/sp_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//fetch stop list
ApiResponse<List<RestourantItem>> useStopList(UniqueKey uniqueKey) {
  ApiConfig apiConfig = useApiConfig();
  DioConfig dioConfig = useMemoized(() {
    if (uniqueKey == null) return null;
    return DioConfig<List<RestourantItem>>(
        path: apiConfig.STOP_LIST(SpUtil.getString('token')),
        transformResponse: (Response response) {
          return listItemsFromJson(response.data);
        });
  },[uniqueKey]);
  ApiResponse<List<RestourantItem>> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}

//turn on off stopList items
ApiResponse<List<RestourantItem>> useStopListOnOff(String fid,UniqueKey uniqueKey) {
  ApiConfig apiConfig = useApiConfig();
  DioConfig dioConfig = useMemoized(() {
    if (fid==null||uniqueKey == null) {
      return null;
    }
    return DioConfig<List<RestourantItem>>(
        path: apiConfig.STOP_LIST_ONOFF(
          fid,
          SpUtil.getString('token'),
        ),
        transformResponse: (Response response) {
          return listItemsFromJson(response.data);
        });
  },[uniqueKey]);
  ApiResponse<List<RestourantItem>> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}
