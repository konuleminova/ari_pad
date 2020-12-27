import 'package:ari_pad/services/provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'change_language_action.dart';

class OrdersRefreshState {
  final UniqueKey uniqueKey;

  OrdersRefreshState({this.uniqueKey});

  OrdersRefreshState copyWith({UniqueKey uniqueKey}) {
    return OrdersRefreshState(uniqueKey: uniqueKey ?? this.uniqueKey);
  }
}

final OrdersRefreshState initState = OrdersRefreshState(uniqueKey: UniqueKey());

//reducer
OrdersRefreshState _reducer(
    OrdersRefreshState state, OrdersRefreshAction action) {
  if (action is OrdersRefreshAction) {
    return state.copyWith(uniqueKey: action.uniqueKey);
  }
  return state;
}
//store

Store<OrdersRefreshState, OrdersRefreshAction> useOrdersRefreshStore() {
  Store<OrdersRefreshState, OrdersRefreshAction> store =
      useReducer(_reducer, initialState: initState);
  return store;
}

Store<OrdersRefreshState, OrdersRefreshAction> getOrdersRefreshKey() {
  return useProvider<Store<OrdersRefreshState, OrdersRefreshAction>>();
}
