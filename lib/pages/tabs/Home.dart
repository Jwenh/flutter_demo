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
            }),
        SizedBox(height: 20),
        RaisedButton(
            child: Text('Device 获取设备信息'),
            onPressed: () {
              Navigator.pushNamed(context, '/device');
            }),
        SizedBox(height: 20),
        RaisedButton(
            child: Text('video_player+chewie播放视频'),
            onPressed: () {
              Navigator.pushNamed(context, '/chewieVideo');
            }),
        SizedBox(height: 20),
        RaisedButton(
            child: Text('网络监听'),
            onPressed: () {
              Navigator.pushNamed(context, '/network');
            })
      ],
    ));
  }
}
