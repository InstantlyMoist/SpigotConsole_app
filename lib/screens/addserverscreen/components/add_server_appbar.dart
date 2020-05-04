import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddServerAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
              child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
          SizedBox(
            width: 15,
          ),
          Text(
            "Add server",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
