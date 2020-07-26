import 'package:device_info/device_info.dart';

import 'package:flutter/material.dart';

class DevicePage extends StatefulWidget {
  DevicePage({Key key}) : super(key: key);

  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getDevice();
  }

//获取设备信息
  _getDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('设备号 ${androidInfo.androidId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Native Device 演示'),
      ),
      body: Text('信息打印在控制台了'),
    );
  }
}
