import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConsoleScreenInput extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final bool numeric;
  final Function(String) enter;

  ConsoleScreenInput({this.controller, this.hint, this.numeric, this.enter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
            ),
            child: TextField(
              onSubmitted: (text) => enter(text),
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
