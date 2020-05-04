import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddServerInput extends StatelessWidget {
  String title = "Server name";
  String hint = "My Example Server";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white,
              focusColor: Colors.red,
              hoverColor: Colors.blue
            ),
          ),
        ],
      ),
    );
  }
}
