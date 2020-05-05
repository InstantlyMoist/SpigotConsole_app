import 'package:flutter/cupertino.dart';
import 'package:spigotconsole/models/server_model.dart';
import 'package:spigotconsole/screens/homescreen/list_item.dart';

class ListWidget extends StatelessWidget {
  List<ServerModel> serverModels;

  ListWidget({this.serverModels});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Your servers",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: serverModels.length,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(model: serverModels[index]);
            },
          ),
        )
      ],
    );
  }
}
