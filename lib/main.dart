import 'package:flutter/material.dart';
import 'package:spigotconsole/screens/loadingscreen/loading_screen.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

void main() {
  InAppPurchaseConnection.enablePendingPurchases();

  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool dark = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: dark ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.orange,
        backgroundColor: dark ? Color(0xFF303030) : Colors.white,
        accentColor: dark ? Color(0xFF373737) : Color(0xFFE07A05),
        fontFamily: 'CircularStd',
      ),
      home: LoadingScreen(),
    );
  }
}


