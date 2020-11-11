import 'package:ari_pad/utils/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ari_pad/utils/size_config.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: 160.toWidth,
            height: 120.toHeight,
          ),
          SizedBox(
            height: 16.toHeight,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: 80.toWidth, vertical: 16.toHeight),
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 2.toWidth),
                        hintText: 'Login',
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 8.toHeight,
                ),
                Container(
                  color: Colors.white,
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 2.toWidth),
                        hintText: 'Password',
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 24.toHeight,
                ),
                InkWell(
                  child: Container(
                    // height: 50.toHeight,
                    color: Colors.black,
                    child: TextField(
                      textAlign: TextAlign.center,
                      enabled: false,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 2.toWidth),
                          hintText: 'LOGIN',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none),
                    ),
                  ),
                  onTap: (){

                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
