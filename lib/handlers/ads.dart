import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:async';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:ads/ads.dart';

class AppAds {
  static Ads _ads;

  static StreamController _controller;
  static MobileAdEvent _event;

  static MobileAdEvent get event => _event;

  static StreamController get controller => _controller;

  static final String _appId = Platform.isAndroid
      ? 'ca-app-pub-1364717858891314~3160076962'
      : 'NOT_IMPLEMENTED';

  static final String _bannerUnitId = Platform.isAndroid
      ? 'ca-app-pub-1364717858891314/5403096924'
      : 'NOT_IMPLEMENTED';

  static void showBanner() => _ads.showBannerAd();

  static void hideBanner() => _ads?.closeBannerAd();

  static void init() {
    _controller = StreamController.broadcast();
    _ads ??= Ads(
      _appId,
      bannerUnitId: _bannerUnitId,
      size: AdSize.banner,
      keywords: <String>['minecraft', 'server', 'computers', 'console'],
      listener: (MobileAdEvent event) {
        _event = event;
        _controller.add(event);
      },
      childDirected: false,
    );
  }

  static void dispose() => _ads?.dispose();
}
