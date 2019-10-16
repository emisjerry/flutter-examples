import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _sValue = "";
  List _aPhones = ["Apple", "Samsung", "Huawei", "ASUS"];
  List<DropdownMenuItem<String>> _dropDownMenuItems = List();

  @override
  void initState() {
    //_dropDownMenuItems = buildItems();
    //_dropDownMenuItems = List();
    for (String _sPhone in _aPhones) {
      _dropDownMenuItems.add(
        DropdownMenuItem(
          value: _sPhone,
          child: Text(_sPhone),
        ),
      );
    }

    _sValue = _dropDownMenuItems[0].value;
    super.initState();
  }

  void _changeItem(String selectedFruit) {
    setState(() {
      _sValue = selectedFruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: getBodyWidget(),
    );

    return scaffold;
  }

  Widget getBodyWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Hello World!",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
          DropdownButton(
            value: _sValue,
            items: _dropDownMenuItems,
            onChanged: _changeItem,
          ),
        ],
      ),
    );
  }
}
