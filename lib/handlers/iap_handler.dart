import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:spigotconsole/handlers/ads.dart';

class IAPHandler {
  static List<ProductDetails> _products = [];

  static StreamSubscription<List<PurchaseDetails>> _subscription;

  static bool shouldShowAds = true;

  static Future<void> init() async {
    final Stream purchaseUpdates =
        InAppPurchaseConnection.instance.purchaseUpdatedStream;
    _subscription = purchaseUpdates.listen((purchases) async {
      switch (purchases[0].status) {
        case PurchaseStatus.purchased:
          BillingResultWrapper result = await InAppPurchaseConnection.instance
              .completePurchase(purchases[0]);
          print(result.responseCode);
          print(purchases[0].productID);
          if (purchases[0].productID == "remove_ads") {
            shouldShowAds = false;
            AppAds.hideBanner();
          }
          break;
      }
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      print(error);
    });

    const Set<String> _kIds = {'remove_ads'};
    final ProductDetailsResponse response = await InAppPurchaseConnection.instance.queryProductDetails(_kIds);
    if (response.notFoundIDs.isNotEmpty) {
      print(response.error);
      // Handle the error.
    } else {
      List<ProductDetails> products = response.productDetails;
      for (ProductDetails product in products) {
        _products.add(product);
        print('${product.title}: ${product.description} (cost is ${product.price})');
      }
    }


    _products = await InAppPurchaseConnection.instance.queryProductDetails(_kIds).then((value) => value.productDetails);

    final QueryPurchaseDetailsResponse pastPurchaseResponse =
        await InAppPurchaseConnection.instance.queryPastPurchases();
    if (pastPurchaseResponse.error != null) {
      print(pastPurchaseResponse.error);
      // Handle the error.
    }
    print(pastPurchaseResponse.pastPurchases);
    for (PurchaseDetails purchase in pastPurchaseResponse.pastPurchases) {
      print(purchase.productID + "hello world!!!");
      if (Platform.isIOS) {
        InAppPurchaseConnection.instance.completePurchase(purchase);
      }
    }
    return null;
  }

  static ProductDetails getByID(String id) {
    print(_products);
    return _products.firstWhere((element) => element.id == id);
  }
}
