import 'package:ari_pad/services/api_helper/api_config.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/api_helper/dio_config.dart';
import 'package:ari_pad/services/hooks/useApiConfig.dart';
import 'package:ari_pad/services/hooks/useDioRequest.dart';
import 'package:ari_pad/utils/sharedpref/sp_util.dart';
import 'package:dio/dio.dart';

ApiResponse<dynamic> useOnOff() {
  final ApiConfig apiConfig = useApiConfig();
  DioConfig dioConfig = DioConfig<dynamic>(
      path: apiConfig.ON_OFF(SpUtil.getString('token')),
      transformResponse: (Response response) {
        return response.data;
      });
  ApiResponse<dynamic> apiResponse = useDioRequest(dioConfig);
  return apiResponse;
}
