import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({Key key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  //建立js通信
  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toast',
        //接受js的信息，做出flutter反馈
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
          showToast(message.message);
          Navigator.pop(context);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('高端豪礼'),
      ),
      body: WebView(
        initialUrl:
            "http://192.168.0.52:8000/pages/dailyBonus20200317/dailyBonus.html",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels:
            <JavascriptChannel>[_alertJavascriptChannel(context)].toSet(),
      ),
    );
  }

  void showToast(String message) {
    AlertDialog(
      title: Text('JS调用了我'),
    );
  }
}
