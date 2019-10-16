import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: getBodyWidget(context),
    );

    return scaffold;
  }

  Widget getBodyWidget(BuildContext context) {
    List<Widget> _aNumbers = [];
    for (var i = 1; i <= 20; i++) {
      _aNumbers.add(
        Card(
          child: ListTile(
            //isThreeLine: true,
            leading: CircleAvatar(child: Text(i.toString()),),
            //i % 2 == 0 ? Icon(Icons.adb) : Icon(Icons.add_alert),
            title: Text(
              "Number " + i.toString(),
            ),
            subtitle: Text("The subtitle line:" + i.toString()),
            trailing: Icon(Icons.keyboard_arrow_down),
          ),
        ),
      );
    }

    return ListView(
      children: _aNumbers,
    );
  }
}
