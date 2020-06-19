import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  final double _height;
  final double _width;

  ProfilePage(this._height, this._width);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _profilePageUI(),
    );
  }

  Widget _profilePageUI() {
    return Align(
      child: SizedBox(
        height: _height * 0.50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _userImageWidget(_image),
            _userNameWidget(_name),
            _userEmailWidget(_email),
            _logoutButton()
          ],
        ),
      ),
    );
  }

  Widget _userImageWidget(String _image) {
    double _imageRadius = _height * 0.20;
    return Container(
      height: _imageRadius,
      width: _imageRadius,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_imageRadius),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(_image),
        )
      ),
    );
  }

  Widget _userNameWidget(String _userName) {
    return Container(
      height: _height * 0.05,
      width: _width,
      child: Text(
        _userName,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }

  Widget _userEmailWidget(String _email) {
    return Container(
      height: _height * 0.05,
      width: _width,
      child: Text(
        _email,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }

  Widget _logoutButton() {
    return Container(
      height: _height * 0.06,
      width: _width * 0.80,
      child: MaterialButton(
        onPressed: () {},
        color: Colors.red,
        child: Text(
          "LOGOUT",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
    );
  }
}