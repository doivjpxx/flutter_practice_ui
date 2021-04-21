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
        _title = 'Covid app';
        break;
      case 2:
        _title = 'Bag shop app';
        break;
      case 3:
        _title = 'Furniture app';
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
      default:
        break;
    }
  }
}
