import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:async';

import 'package:spigotconsole/handlers/iap_handler.dart';

class AppAds {
  static BannerAd _bannerAd;

  static StreamController _controller;

  static bool disposed = false;
  static bool open = true;

  static StreamController get controller => _controller;

  static final String _appId = Platform.isAndroid
      ? 'ca-app-pub-1364717858891314~3160076962'
      : 'NOT_IMPLEMENTED';

  static final String _bannerUnitId = Platform.isAndroid
      ? 'ca-app-pub-1364717858891314/5403096924'
      : 'NOT_IMPLEMENTED';

  static void showBanner() {
    if (!IAPHandler.shouldShowAds) return;
    _bannerAd
      ..load()
      ..show();
    _controller.add(true);
  }

  static void hideBanner() {
    _bannerAd.dispose();
    _controller.add(false);
  }

  static void init() {
    FirebaseAdMob.instance.initialize(appId: _appId);
    _controller = StreamController.broadcast();

    _bannerAd = BannerAd(
        adUnitId: _bannerUnitId,
        size: AdSize.banner,
        targetingInfo: MobileAdTargetingInfo(
            keywords: <String>['minecraft', 'server', 'computers', 'console']),
        listener: (MobileAdEvent event) {
          print("EVENT FOUND $event");
        });
  }
}
