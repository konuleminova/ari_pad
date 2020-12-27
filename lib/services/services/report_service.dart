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

ApiResponse<List<RestourantItem>> useReport(UniqueKey uniqueKey) {
  ApiConfig apiConfig = useApiConfig();
  DioConfig dioConfig = useMemoized(() {
    if (uniqueKey == null) return null;
    return DioConfig<List<RestourantItem>>(
        path: apiConfig.REPORT(SpUtil.getString('token')),
        transformResponse: (Response response) {
          print('response data ');
          if(response.data==[]){
            print(' ifresponse data ${response.data}');
            return List<RestourantItem>();
          }
          return listItemsFromJson(response.data);
        });
  });
  ApiResponse<List<RestourantItem>> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}
