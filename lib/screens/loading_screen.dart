import 'package:flutter/material.dart';
import 'package:spigotconsole/repository/shared_preferences_repository.dart';
import 'package:spigotconsole/screens/welcome_screen.dart';
import 'package:spigotconsole/utils/screen_pusher.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    load();
  }

  void load() async {
    await SharedPreferencesRepository().load();

    if (context.mounted) {
      if (SharedPreferencesRepository().getName() == null) {
        ScreenPusher.pushScreen(
          context,
          WelcomeScreen(),
          true,
        );
      } else {
        Navigator.pushReplacementNamed(context, "/server_overview");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Loading..."),
      ),
    );
  }
}
