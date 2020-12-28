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
    final uniqueKeyFID = useState<UniqueKey>(UniqueKey());
    final fid = useState<String>();
    final apiResponseValue =
        useState<ApiResponse<List<RestourantItem>>>(ApiResponse.loading());

    //stopListOnOff callback
    useStopListOnOff(fid.value, uniqueKeyFID.value);

    //fetch stoplist
    ApiResponse<List<RestourantItem>> apiResponse =
        useStopList(uniqueKey.value);

    useEffect(() {
      if (apiResponse.status == Status.Done) {
        apiResponseValue.value = apiResponse;
      }
      return () {};
    }, [apiResponse.status]);
    //useStopListonOff callBack
    final stopListOnOffCallBack = useCallback((String id, int index) {
      print('HERE cllaback ${id}');
      apiResponseValue.value.data[index].isLoading = true;
      fid.value = id;
      uniqueKeyFID.value = new UniqueKey();
      if (apiResponseValue.value.data[index].item_3 == '1') {
        apiResponseValue.value.data[index].item_3 = '0';
      } else if (apiResponseValue.value.data[index].item_3 == '0') {
        apiResponseValue.value.data[index].item_3 = '1';
      }

      Future.delayed(Duration(milliseconds: 200)).then((value) {
        if (apiResponseValue.value.status == Status.Done) {
          apiResponseValue.value.data[index].isLoading = false;
        }
      });
    }, [fid.value]);
    // TODO: implement build
    return CustomErrorHandler(
      statuses: [apiResponseValue.value.status],
      errors: [apiResponseValue.value.error],
      child: StopListView(apiResponseValue?.value?.data, stopListOnOffCallBack),
    );
  }
}
