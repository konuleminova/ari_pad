import 'package:ari_pad/business_logic/models/RestourantItem.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/services/stop_list.dart';
import 'package:ari_pad/ui/common_widgets/error_handler.dart';
import 'package:ari_pad/ui/views/stoplist/stoplist.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StopListViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ApiResponse<List<RestourantItem>> apiResponse = useStopList(UniqueKey());
    // TODO: implement build
    return CustomErrorHandler(
      statuses: [apiResponse.status],
      errors: [apiResponse.error],
      child: StopListView(apiResponse.data),
    );
  }
}
