import 'package:ari_pad/business_logic/models/RestourantItem.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/hooks/use_callback.dart';
import 'package:ari_pad/services/services/stop_list.dart';
import 'package:ari_pad/ui/common_widgets/error_handler.dart';
import 'package:ari_pad/ui/views/stoplist/stoplist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StopListViewModel extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final uniqueKey = useState<UniqueKey>(UniqueKey());
    final fid = useState<String>();

    //stopListOnOff callback
    useStopListOnOff(fid.value, uniqueKey.value);

    //fetch stoplist
    ApiResponse<List<RestourantItem>> apiResponse =
        useStopList(uniqueKey.value);

    //useStopListonOff callBack
    final stopListOnOffCallBack = useCallback((String id, int index) {
      print('HERE cllaback ${id}');
      fid.value = id;
//      if (apiResponse.data[index].item_3 == '1') {
//        apiResponse.data[index].item_3 = '0';
//      } else {
//        apiResponse.data[index].item_3 = '1';
//      }

     Future.delayed(Duration(milliseconds: 400)).then((value){
       uniqueKey.value = new UniqueKey();
     });
    }, [fid.value]);
    // TODO: implement build
    return CustomErrorHandler(
      statuses: [apiResponse.status],
      errors: [apiResponse.error],
      child: StopListView(apiResponse.data, stopListOnOffCallBack),
    );
  }
}
