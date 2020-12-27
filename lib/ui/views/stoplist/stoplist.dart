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
  var stopListOnOffCallBack;

  StopListView(this.items, this.stopListOnOffCallBack);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'StopList:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 54,
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(0.7),
                    color: items[index].item_3 == '1'
                        ? Color(0xFFCD0000).withOpacity(0.3)
                        : index % 2 == 0
                            ? ThemeColor().greyColor.withOpacity(0.6)
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
                              height: 54,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: items[index].item_3 == '1'
                                      ? Color(0xFFCD0000)
                                      : Color(0xFF0052cd)),
                              child: Text(
                                items[index].item_3 == '0'
                                    ? 'Turn off'
                                    : 'Turn on',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () {
                            print('FID ${items[index].id}');
                            stopListOnOffCallBack(items[index].id, index);
                          },
                        ))
                      ],
                    ),
                  );
                },
                itemCount: items.length,
                shrinkWrap: true,
              ),
            )
          ],
        ));
  }
}
