import 'package:flutter/material.dart';

class RecentConversationsPage extends StatelessWidget {

  final double _height;
  final double _width;

  RecentConversationsPage(this._height, this._width);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      child: _conversationsListViewWidget(),
    );
  }

  Widget _conversationsListViewWidget(){
    return Container(
      height: _height,
      width: _width,
      child: ListView.builder(
          itemCount: 1,
        itemBuilder: (_context, _index) {
            return ListTile(
              onTap: () {},
              title: Text("Testowy test"),
              subtitle: Text("subtitle"),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/chatify-cea06.appspot.com/o/profile_images%2FwsJ9m8D9w6OHuEjASM2vz8G47Zu1?alt=media&token=2d3fdec2-6270-4ee6-aea7-9a19d2a314fa'),
                  )
                ),
              ),
              trailing: _listTileTrailingWidget(),
            );
        },
      ),
    );
  }

  Widget _listTileTrailingWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          "lastSeen",
          style: TextStyle(
              fontSize: 15
          ),
        ),
        Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }
}