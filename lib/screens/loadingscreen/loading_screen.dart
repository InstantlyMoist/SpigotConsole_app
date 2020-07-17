import 'dart:async';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/handlers/ServerModelHandler.dart';
import 'package:spigotconsole/handlers/SharedPreferencesHandler.dart';
import 'package:spigotconsole/handlers/ads.dart';
import 'package:spigotconsole/handlers/iap_handler.dart';
import 'package:spigotconsole/screens/homescreen/homescreen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {


    await SharedPreferencesHandler.init();
    await ServerModelHandler.init();

    await IAPHandler.init();

    AppAds.init();
    AppAds.showBanner();

    await Future.delayed(Duration(seconds: 1));

    Navigator.of(context).pop();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: SizedBox(
            height: 32,
            width: 32,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            )),
      ),
    );
  }
}
