import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20),
        RaisedButton(
            child: Text('跳转到上拉分页加载更多页面'),
            onPressed: () {
              Navigator.pushNamed(context, '/news');
            })
      ],
    ));
  }
}
