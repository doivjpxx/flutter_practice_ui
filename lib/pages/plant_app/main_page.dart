import 'package:flutter/material.dart';

class MyMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: (context, index) {
          return ListTile(
            title: _buildText(index),
            onTap: () => _routeChange(context, index),
          );
        },
      ),
    );
  }

  Text _buildText(int index) {
    var _title = '';
    switch (index) {
      case 0:
        _title = 'Plant app';
        break;
      case 1:
        _title = 'Buy Stuff';
        break;
      case 2:
        _title = 'Choose Your Plan';
        break;
      case 3:
        _title = 'Detail Product';
        break;
      case 4:
        _title = 'Main Page';
        break;
      case 5:
        _title = 'Confirm Order';
        break;
      case 6:
        _title = 'Cart 2';
        break;
      case 7:
        _title = 'Main Page 2';
        break;
      case 8:
        _title = 'Shopping';
        break;
      case 9:
        _title = 'Detail 2';
        break;
      case 10:
        _title = 'Detail 3';
        break;
      default:
        break;
    }
    return Text(_title);
  }

  _routeChange(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/first');
        break;
      case 1:
        Navigator.pushNamed(context, '/second');
        break;
      case 2:
        Navigator.pushNamed(context, '/third');
        break;
      case 3:
        Navigator.pushNamed(context, '/four');
        break;
      case 4:
        Navigator.pushNamed(context, '/five');
        break;
      case 5:
        Navigator.pushNamed(context, '/six');
        break;
      case 6:
        Navigator.pushNamed(context, '/seven');
        break;
      case 7:
        Navigator.pushNamed(context, '/eight');
        break;
      case 8:
        Navigator.pushNamed(context, '/nine');
        break;
      case 9:
        Navigator.pushNamed(context, '/ten');
        break;
      case 10:
        Navigator.pushNamed(context, '/eleven');
        break;
      default:
        break;
    }
  }
}
