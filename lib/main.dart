import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spigotconsole/screens/addserverscreen/add_server_screen.dart';
import 'package:spigotconsole/screens/homescreen/list_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
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
  Widget baseWidget;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var servers = preferences.get("servers");
    if (servers == null)
      baseWidget =
          new Text('No servers found, add some by pressing the + icon');
    else
      baseWidget = ListWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddServerScreen()),
        ),
        tooltip: 'Add server',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
