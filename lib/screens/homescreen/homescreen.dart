import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:spigotconsole/handlers/ServerModelHandler.dart';
import 'package:spigotconsole/handlers/ads.dart';
import 'package:spigotconsole/handlers/iap_handler.dart';
import 'package:spigotconsole/models/server_model.dart';
import 'package:spigotconsole/screens/addserverscreen/add_server_screen.dart';
import 'package:spigotconsole/screens/homescreen/list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool adOpen = AppAds.open;

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

  void loadData() async {
    for (ServerModel serverModel in ServerModelHandler.serverModels) {
      selectedItems[serverModel] = false;
    }

    AppAds.controller.stream.listen((event) {
      print(event);
      setState(() {
        adOpen = event;
        updateListItems();
      });
    });
    updateListItems();
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
            itemCount: selectedItems.keys.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == selectedItems.keys.length) return IAPHandler.shouldShowAds ? FlatButton(
                child: Text("Wish to remove ads? Click "),
                onPressed: () {
                  InAppPurchaseConnection.instance.buyConsumable(purchaseParam: PurchaseParam(productDetails: IAPHandler.getByID("remove_ads")));
                },
              ) : Container(); else return listItems[index];
            },
          ),
        ),
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
  void dispose() {
    super.dispose();
    AppAds.hideBanner();
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
              "SpigotConsole",
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
