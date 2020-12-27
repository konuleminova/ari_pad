import 'package:ari_pad/business_logic/models/RestourantItem.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/services/report_service.dart';
import 'package:ari_pad/ui/common_widgets/error_handler.dart';
import 'package:ari_pad/ui/views/report/report_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReportViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    //fetch report list
    ApiResponse<List<RestourantItem>> apiResponse = useReport(UniqueKey());
    // TODO: implement build
    return CustomErrorHandler(
      errors: [
        apiResponse.error,
      ],
      statuses: [apiResponse.status],
      child: ReportView(apiResponse.data??[]),
    );
  }
}
