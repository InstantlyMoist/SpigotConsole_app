import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddServerInput extends StatelessWidget {

  final TextEditingController controller;
  final String title;
  final String hint;
  final bool numeric;

  AddServerInput({this.controller, this.title, this.hint, this.numeric});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
            ),
            child: TextField(
              controller: controller,
              keyboardType: numeric ? TextInputType.number : TextInputType.text,
              autofocus: false,
              style: TextStyle(fontSize: 14, color: Colors.white),
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).accentColor,
                hintText: hint,
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                contentPadding:
                    const EdgeInsets.only(left: 14.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
