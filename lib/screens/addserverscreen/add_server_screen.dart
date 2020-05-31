import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/handlers/ConnectionHandler.dart';
import 'package:spigotconsole/handlers/ServerModelHandler.dart';
import 'package:spigotconsole/models/server_model.dart';
import 'package:spigotconsole/screens/addserverscreen/components/add_server_appbar.dart';
import 'package:spigotconsole/screens/addserverscreen/components/add_server_input.dart';
import 'package:spigotconsole/screens/addserverscreen/components/add_server_scanner.dart';
import 'package:web_socket_channel/io.dart';

class AddServerScreen extends StatelessWidget {

  final GlobalKey globalKey;
  final Function(ServerModel) onServerAdd;

  AddServerScreen({this.globalKey, this.onServerAdd});

  final TextEditingController serverNameController = new TextEditingController();
  final TextEditingController serverIpController = new TextEditingController();
  final TextEditingController serverPortController = new TextEditingController();


  void handleScan(BuildContext context) async {

    var options = ScanOptions(
      restrictFormat: [BarcodeFormat.qr],
    );
    var result = await BarcodeScanner.scan(options: options);
    print(result.rawContent);

    ServerModel model = ServerModel(ip: serverIpController.value.text, key: result.rawContent, port: int.tryParse(serverPortController.value.text), serverName: serverNameController.value.text);
    ConnectionHandler.connect(globalKey, model, true);
    ServerModelHandler.addModel(model);
    onServerAdd(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AddServerAppBar(),
              AddServerInput(
                title: "Server name",
                hint: "My Example Server",
                numeric: false,
                controller: serverNameController,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: AddServerInput(
                      title: "Server IP",
                      hint: "github.com/InstantlyMoist",
                      numeric: false,
                      controller: serverIpController,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: AddServerInput(
                      title: "Port",
                      hint: "25565",
                      numeric: true,
                      controller: serverPortController,
                    ),
                  ),
                ],
              ),
              AddServerScanner(
                onScan: () => handleScan(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
