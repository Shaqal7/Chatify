import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  double _height;
  double _width;

  TabController _tabController;

  _HomePageState(){
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 16),
        ),
        title: Text("Chatify"),
        bottom: TabBar(
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.people_outline,
                size: 24,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 24,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person_outline,
                size: 24,
              ),
            ),
        ]),
      ),
      body: _tabBarPages(),
    );
  }

  Widget _tabBarPages() {
    return TabBarView(controller: _tabController, children: <Widget>[
      ProfilePage(this._height, this._width),
      ProfilePage(this._height, this._width),
      ProfilePage(this._height, this._width),
    ]);
  }
}