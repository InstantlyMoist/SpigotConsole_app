import 'package:flutter/cupertino.dart';

class ListWidget extends StatelessWidget {
  // TODO: Load in servers from constructor...

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          "Your servers",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        )
      ],
    );
  }
}
