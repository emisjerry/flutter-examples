// https://juejin.im/post/5be5356bf265da61602c6f68
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

const BIKE = 0, WALK = 1, BUS = 2;

class MyApp extends StatelessWidget {
  static List<Map> _lstTabs = [
    {"text": "自行車", "icon": Icon(Icons.directions_bike)},
    {"text": "步行", "icon": Icon(Icons.directions_walk)},
    {"text": "巴士", "icon": Icon(Icons.directions_bus)},
  ];
  TabController _tabController = TabController(
    length: _lstTabs.length,
    vsync: ScrollableState(),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('顶部tab切换'),
          bottom: getTabBar(),
        ),
        drawer: getDrawer(),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  _lstTabs[WALK]["text"], style: TextStyle(color: Colors.white)
                ),
              ),
            ),
            Container(
              color: Colors.green,
              child: Center(
                child: Text(
                  _lstTabs[BIKE]["text"], style: TextStyle(color: Colors.white)
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  _lstTabs[BUS]["text"], style: TextStyle(color: Colors.white)
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.orange,
          child: _drawer,
        ),
      ),
    );
  }

  Widget getTabBar() {
    return TabBar(
//      labelColor: Colors.white,
//      indicatorColor: Colors.red,
//      unselectedLabelColor: Colors.grey,
      tabs: <Widget>[
        new Tab(
          icon: _lstTabs[WALK]["icon"],
          child: Text(_lstTabs[WALK]["text"]),
        ),
        new Tab(
          icon: _lstTabs[BIKE]["icon"],
          child: Text(_lstTabs[BIKE]["text"]),
        ),
        new Tab(
          icon: _lstTabs[BUS]["icon"],
          child: Text(_lstTabs[BUS]["text"]),
        ),
      ],
      controller: _tabController,
    );
  }

  get _drawer {
    return Drawer(child: Text("Item"),);
  }
}
