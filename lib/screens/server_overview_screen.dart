import 'package:flutter/material.dart';
import 'package:spigotconsole/repository/server_data_repository.dart';
import 'package:spigotconsole/styling/spigotconsole_padding.dart';
import 'package:spigotconsole/ui/text/H1.dart';
import 'package:spigotconsole/ui/tiles/server_tile.dart';

class ServerOverviewScreen extends StatefulWidget {
  const ServerOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ServerOverviewScreen> createState() => _ServerOverviewScreenState();
}

class _ServerOverviewScreenState extends State<ServerOverviewScreen> {

  late ServerDataRepository serverDataRepository;

  @override
  void initState() {
    super.initState();

    serverDataRepository = ServerDataRepository();
    serverDataRepository.loadFromPreferences();

    load();
  }

  void load() async {
    await serverDataRepository.refreshAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: SpigotConsolePadding.basePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const H1(text: "Servers"),
            ElevatedButton(
              onPressed: load,
              child: const Text("Refresh"),
            ),
            for (var server in serverDataRepository.serverData)
              ServerTile(serverData: server)
          ],
        ),
      ),
    );
  }
}
