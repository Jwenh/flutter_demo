import 'package:flutter/material.dart';
import './Webview.dart';

class TestH5Page extends StatefulWidget {
  TestH5Page({Key key}) : super(key: key);

  @override
  _TestH5PageState createState() => _TestH5PageState();
}

class _TestH5PageState extends State<TestH5Page> {
  _toH5() {
    print('点击跳转去h5');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WebViewPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('h5 demo'),
      ),
      body: Container(
        child: RaisedButton(
            color: Color(0xFFFE5F23),
            textColor: Colors.white,
            child: Text('跳转h5页面'),
            onPressed: this._toH5),
      ),
    );
  }
}
