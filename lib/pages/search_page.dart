import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget{

  double _height;
  double _width;

  SearchPage(this._height, this._width);

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _searchPageUI(),
    );
  }

  Widget _searchPageUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _userSearchField(),
        _usersListView(),
      ],
    );
  }

  Widget _userSearchField() {
    return Container(
      height: this.widget._height * 0.08,
      width: this.widget._width,
      padding: EdgeInsets.symmetric(vertical: this.widget._height * 0.02),
      child: TextField(
        autocorrect: false,
        style: TextStyle(
          color: Colors.white
        ),
        onSubmitted: (_input) {

        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          labelStyle: TextStyle(
              color: Colors.white
          ),
          labelText: "Search",
          border: OutlineInputBorder(
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }

  Widget _usersListView(){
    return Container(
      height: this.widget._height * 0.75,
      child: ListView.builder(
        itemCount: 1,
          itemBuilder: (BuildContext _context, int _index) {
            return ListTile(
              title: Text("Testowy title"),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/chatify-cea06.appspot.com/o/profile_images%2FwsJ9m8D9w6OHuEjASM2vz8G47Zu1?alt=media&token=2d3fdec2-6270-4ee6-aea7-9a19d2a314fa'),
                    //image: NetworkImage(_data[_index].image),
                  )
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Last Seen",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "About 10 months",
                    style: TextStyle(fontSize: 15),
                  ),
              ]),
            );
      }),
    );
  }
}