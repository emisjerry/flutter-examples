import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      routes: <String, WidgetBuilder>{
        // define the routes
        "/settings": (BuildContext context) => SettingsScreen(),
        "/account": (BuildContext context) => AccountScreen(),
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: getBodyWidget(),
      drawer: getDrawer(),
    );

    return scaffold;
  }

  Widget getBodyWidget() {
    return Container(
      child: Text(
        "Hello World!",
        style: TextStyle(
          color: Colors.red,
          fontSize: 30,
        ),
      ),
    );
  }

  Widget getDrawer() {
    var headerChild = DrawerHeader(child: Text("Header"));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));
    var myNavChildren = [
      headerChild,
      getItem(icon: Icons.settings, routeName: "settings", route: "/settings"),
      getItem(icon: Icons.home, routeName: "Home", route: "/"),
      getItem(icon: Icons.account_box, routeName: "Account", route: "/account"),
      aboutChild
    ];
    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  ListTile getItem({IconData icon, String routeName, String route}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(routeName),
      onTap: () {
        setState(() {
          Navigator.of(context).pop(); // Close the drawer, back to /
          Navigator.of(context).pushNamed(route);
        });
      },
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Container(
        child: Text(
          "Settings",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      ),
    );

    return scaffold;
  }
}

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      appBar: AppBar(title: Text("Account")),
      body: Container(
        child: Text(
          "Account",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      ),
    );

    return scaffold;
  }
}
