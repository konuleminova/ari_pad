import 'package:ari_pad/services/api_helper/api_response.dart';
import 'package:ari_pad/services/hooks/useSideEffect.dart';
import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ari_pad/utils/size_config.dart';

import 'loading.dart';

class CustomErrorHandler extends HookWidget {
  final List<Status> statuses;
  final List<AppException> errors;
  final Widget child;
  final Function onRefresh;

  const CustomErrorHandler(
      {this.statuses, this.child, this.errors, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return statuses.first == Status.Loading ? Loading() : child;
  }
}

class ErrorDialog extends StatelessWidget {
  String errorMessage;

  ErrorDialog({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(16.toHeight),
           height: 140.toHeight,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Column(
            children: <Widget>[
              Expanded(
                child: Text(errorMessage ?? 'Some Unkown Error Occured.',textAlign: TextAlign.center,),
              ),
              SizedBox(
                height: 16.toHeight,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.toWidth),
                height: 34.toHeight,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.red,
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                width: SizeConfig().screenWidth,
              )
            ],
          )),
        ));
  }
}
