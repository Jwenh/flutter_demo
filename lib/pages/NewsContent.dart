import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewsContent extends StatefulWidget {
  Map arguments;
  NewsContent({Key key, this.arguments}) : super(key: key);

  @override
  _NewsContentState createState() => _NewsContentState(this.arguments);
}

class _NewsContentState extends State<NewsContent> {
  Map arguments;
  bool _flag = true;
  _NewsContentState(this.arguments);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(this.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新闻详情'),
      ),
      body: Column(children: <Widget>[
        this._flag ? _getMoreWidget() : Text(''),
        Expanded(
            child: InAppWebView(
          initialUrl:
              "http://www.phonegap100.com/newscontent.php?aid=${this.arguments["aid"]}",
          onProgressChanged: (InAppWebViewController controller, int progress) {
            if ((progress / 100) > 0.999) {
              setState(() {
                this._flag = false;
              });
            }
          },
        ))
      ]),
    );
  }

  Widget _getMoreWidget() {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('加载中...', style: TextStyle(fontSize: 16.0)),
                CircularProgressIndicator(
                  strokeWidth: 1.0,
                )
              ],
            )));
  }
}
