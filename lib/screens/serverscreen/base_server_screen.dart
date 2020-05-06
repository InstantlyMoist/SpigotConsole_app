import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/handlers/ConnectionHandler.dart';
import 'package:spigotconsole/models/server_model.dart';
import 'package:spigotconsole/screens/serverscreen/console_screen.dart';

class BaseServerScreen extends StatefulWidget {
  @override
  _BaseServerScreenState createState() => _BaseServerScreenState();

  ServerModel serverModel;

  BaseServerScreen({this.serverModel});
}

class _BaseServerScreenState extends State<BaseServerScreen> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ConnectionHandler.connection.sink.close();
        return false;
      },
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              widget.serverModel.serverName,
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Information", style: TextStyle(color: Colors.white),),),
                Tab(child: Text("Console", style: TextStyle(color: Colors.white),),),
                Tab(child: Text("Server settings", style: TextStyle(color: Colors.white),),),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              ConsoleScreen(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
