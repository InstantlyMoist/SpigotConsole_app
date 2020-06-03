//import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/handlers/ServerModelHandler.dart';
import 'package:spigotconsole/handlers/SharedPreferencesHandler.dart';
import 'package:spigotconsole/models/server_model.dart';
import 'package:spigotconsole/screens/addserverscreen/add_server_screen.dart';
import 'package:spigotconsole/screens/homescreen/list_item.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:firebase_admob/firebase_admob.dart';
import 'package:ads/ads.dart';

void main() => runApp(MyApp());

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
      home: HomeScreen(title: 'SpigotConsole'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Ads appAds;

  GlobalKey _globalKey = GlobalKey();

  Widget baseWidget;

  List<ListItem> listItems = List();
  Map<ServerModel, bool> selectedItems = Map();

  String titleText;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  bool adOpen = false;

  final String bannerUnitId = Platform.isAndroid
      ? 'ca-app-pub-1364717858891314/5403096924'
      : 'NOT_IMPLEMENTED';

  void loadData() async {
    var eventListener = (MobileAdEvent event) {
      if (event == MobileAdEvent.loaded) {
        setState(() {
          adOpen = true;
        });
      }
      if (event == MobileAdEvent.closed) {
        setState(() {
          adOpen = false;
        });
      }
    };

    appAds = Ads(
      "ca-app-pub-1364717858891314~3160076962",
      bannerUnitId: bannerUnitId,
      size: AdSize.banner,
      keywords: <String>['ibm', 'computers'],
      contentUrl: 'http://www.ibm.com',
      childDirected: false,
      listener: eventListener,
      testDevices: ['IN2023'],
      testing: true,
    );

    await SharedPreferencesHandler.loadSharedPreferences();
    print("Loading shared preferences OK!");

    List<ServerModel> serverModels = ServerModelHandler.loadServerModels();
    setState(() {
      for (ServerModel model in serverModels) {
        selectedItems[model] = false;
      }
      updateListItems();
    });
    appAds.showBannerAd();
  }

  void updateBaseWidget() {
    if (selectedItems.isEmpty) {
      baseWidget = Text('No servers found, add some by pressing the + icon');
      return;
    }
    baseWidget = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          titleText,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: selectedItems.keys.length,
            itemBuilder: (BuildContext context, int index) {
              return listItems[index];
            },
          ),
        )
      ],
    );
  }

  void updateListItems() {
    listItems = List();
    for (ServerModel model in selectedItems.keys) {
      listItems.add(ListItem(
        globalKey: _globalKey,
        model: model,
        selected: selectedItems[model],
        hasOtherSelected: hasSelectedServers(),
        onSelectChange: (model, selected) {
          selectedItems[model] = selected;
          setState(() {
            updateListItems();
          });
        },
      ));
    }
    titleText = hasSelectedServers()
        ? "Selected servers: ${getSelectedServers()}"
        : "Your servers";
    updateBaseWidget();
  }

  bool hasSelectedServers() {
    return selectedItems.containsValue(true);
  }

  int getSelectedServers() {
    int found = 0;
    for (bool value in selectedItems.values) {
      if (value) found++;
    }
    return found;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        //TODO: Check if banner is actually loaded (donation = off) if not, remove padding
        padding: EdgeInsets.only(bottom: adOpen ? 50 : 0),
        child: Scaffold(
          key: _globalKey,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              widget.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(23),
            child: baseWidget,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).accentColor,
            onPressed: () {
              if (hasSelectedServers()) {
                for (ListItem item in listItems) {
                  if (selectedItems[item.model] == true) {
                    selectedItems.remove(item.model);
                    ServerModelHandler.removeModel(item.model);
                  }
                  print(selectedItems);
                  setState(() {
                    updateListItems();
                  });
                }
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddServerScreen(
                          globalKey: _globalKey,
                          onServerAdd: (model) {
                            selectedItems[model] = false;
                            setState(() {
                              updateListItems();
                            });
                          },
                        )),
              );
            },
            tooltip: 'Add server',
            child: Icon(
              hasSelectedServers() ? Icons.delete : Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
