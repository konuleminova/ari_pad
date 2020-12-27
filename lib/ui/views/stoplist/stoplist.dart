import 'package:ari_pad/business_logic/models/RestourantItem.dart';
import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/services/stop_list.dart';
import 'package:ari_pad/utils/size_config.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StopListView extends HookWidget {
  List<RestourantItem> items;
  var  stopListOnOffCallBack;

  StopListView(this.items, this.stopListOnOffCallBack);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 54,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(0.7),
            color: items[index].item_3 == '1'
                ? Colors.red.withOpacity(0.6)
                : index % 2 == 0
                    ? Colors.grey
                    : ThemeColor().grey1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Container(
                  child: Text(items[index].item_1 ?? ''),
                )),
                Expanded(
                    child: Container(
                  child: Text(items[index].item_2 ?? ''),
                )),
                Expanded(
                    child: InkWell(
                  child: Container(
                    width: SizeConfig().screenWidth,
                    alignment: Alignment.centerRight,
                    child: Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: items[index].item_3 == '1'
                              ? Colors.red
                              : Colors.blue),
                      child: Text(
                        items[index].item_3 == '1' ? 'Turn off' : 'Turn on',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    print('FID ${items[index].id}');
                    stopListOnOffCallBack(items[index].id,index);
                  },
                ))
              ],
            ),
          );
        },
        itemCount: items.length,
        shrinkWrap: true,
      ),
    );
  }
}
