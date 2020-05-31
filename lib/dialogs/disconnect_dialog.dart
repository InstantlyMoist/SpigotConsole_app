import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisconnectDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 55, right: 55),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Connection aborted!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "The server closed the remote connection...",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Tap to dismiss error",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}