class RestourantItem {
  String id;
  String item_1;
  String item_2;
  String item_3;
  bool isLoading=false;

  RestourantItem.fromJson(Map<String, dynamic> json) {
    id = json['id']??'';
    item_1 = json['item_1'] ?? '';
    item_2 = json['item_2'] ?? '';
    item_3 = json['item_3'] ?? '';
  }
}

listItemsFromJson(List<dynamic> restoruantItems) => List<RestourantItem>.from(
    restoruantItems.map((e) => RestourantItem.fromJson(e)));
