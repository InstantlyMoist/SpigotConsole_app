import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddServerScanner extends StatelessWidget {

  VoidCallback onScan;

  AddServerScanner({this.onScan});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Secret key",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "The Secret Key is your own, unique, authentication key. This key can be found in your console. To make the process easier we will be using your camera. This code should NEVER be shared, this key is linked to your server and will grant FULL server access, be cautious!",
            style: TextStyle(color: Colors.white, height: 1.5),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => onScan(),
            child: Container(
              width: 115,
              height: 42,
              decoration: BoxDecoration(
                color: Color(0xFFE07A05),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Let's go!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
