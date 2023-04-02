import 'package:flutter/material.dart';
import 'package:spigotconsole/repository/server_data_repository.dart';
import 'package:spigotconsole/screens/loading_screen.dart';
import 'package:spigotconsole/styling/spigotconsole_padding.dart';
import 'package:spigotconsole/ui/text/h1.dart';
import 'package:spigotconsole/ui/tiles/server_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoadingScreen(),
    );
  }
}