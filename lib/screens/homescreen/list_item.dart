import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spigotconsole/handlers/ConnectionHandler.dart';
import 'package:spigotconsole/models/server_model.dart';

class ListItem extends StatefulWidget {

  final GlobalKey globalKey;
  final ServerModel model;
  final Function(ServerModel, bool) onSelectChange;
  final bool selected;
  final bool hasOtherSelected;

  ListItem({this.globalKey, this.model, this.onSelectChange, this.selected, this.hasOtherSelected});

  @override
  _ListItemState createState() => _ListItemState();

}

class _ListItemState extends State<ListItem> {

  Color getBaseColor() {
    ThemeData data = Theme.of(context);
    if (widget.selected) {
      return data.brightness == Brightness.dark ? Color(0xFF6B6B6B) : Color(0xFFFDA541);
    }
    return data.accentColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          if (widget.selected) {
            setState(() {
              widget.onSelectChange(widget.model, false);
            });
            return;
          }
          if (widget.hasOtherSelected) {
            setState(() {
              widget.onSelectChange(widget.model, true);
            });
            return;
          }
          ConnectionHandler.connect(widget.globalKey, widget.model, false);
        },
        onLongPress: () {
          setState(() {
            widget.onSelectChange(widget.model, true);
          });
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: getBaseColor(),
          ),
          height: 72,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.model.serverName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    Text(widget.model.ip,  style: TextStyle(color: Colors.white)),
                  ],
                ),
                Spacer(),
                Icon(Icons.navigate_next, color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
