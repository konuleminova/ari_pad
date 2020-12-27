import 'package:ari_pad/business_logic/models/RestourantItem.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  List<RestourantItem> items;

  ReportView(this.items);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(16),
            color: (index % 2 == 0) ? Colors.grey : ThemeColor().grey1,
            height: 54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(items[index].item_1 ?? ''),
                  flex: 2,
                ),
                Expanded(
                    child: Container(
                  child: Text(items[index].item_2 ?? ''),
                  alignment: Alignment.centerRight,
                ))
              ],
            ),
          );
        },
        shrinkWrap: true,
        itemCount: items.length,
      ),
    );
  }
}
