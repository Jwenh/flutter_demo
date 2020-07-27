import 'package:flutter/material.dart';
import '../common/Storage.dart';

class StoragePage extends StatefulWidget {
  StoragePage({Key key}) : super(key: key);

  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地存储'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('保存数据'),
            onPressed: () {
              Storage.setString('username', 'zhsnan1111');
            },
          ),
          SizedBox(height: 10),
          RaisedButton(
            child: Text('获取数据'),
            onPressed: () {
              print(Storage.getString('username'));
            },
          ),
          SizedBox(height: 10),
          RaisedButton(
            child: Text('清除数据'),
            onPressed: () {
              print(Storage.remove('username'));
            },
          )
        ],
      )),
    );
  }
}
