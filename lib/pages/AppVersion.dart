import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:open_file/open_file.dart';

class AppVersionPage extends StatefulWidget {
  AppVersionPage({Key key}) : super(key: key);

  @override
  _AppVersionPageState createState() => _AppVersionPageState();
}

class _AppVersionPageState extends State<AppVersionPage> {
  @override
  void initState() {
    super.initState();
    this._getPackageInfo();
    this._getAppPath();
  }

  //获取版本号
  void _getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    print("appName:$appName");

    print("packageName:$packageName");

    print("version:$version");

    print("buildNumber:$buildNumber");
  }

// 获取路径
  void _getAppPath() async {
    Directory tempDir = await getTemporaryDirectory(); //临时目录
    String tempPath = tempDir.path;
    Directory appDocDir = await getApplicationDocumentsDirectory(); //文档目录
    String appDocPath = appDocDir.path;
    var directory = await getExternalStorageDirectory();
    String storageDirectory = directory.path;
    print("tempPath:${tempPath}");

    print("appDocDir:${appDocPath}");

    print("StorageDirectory:${storageDirectory}");
  }

  //下载并打开
  void _downLoad() async {
    final directory = await getExternalStorageDirectory();
    String _localPath = directory.path;
    final taskId = await FlutterDownloader.enqueue(
        url: 'http://www.ionic.wang/jdshop.apk',
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: true);
    FlutterDownloader.registerCallback((id, status, progress) {
      print(status);
      print('111111');
      print(progress);
    });
    //打开文件
    OpenFile.open("${_localPath}/jdshop.apk");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward),
        onPressed: _downLoad,
      ),
      appBar: AppBar(
        title: Text('app升级'),
      ),
      body: Text('app升级'),
    );
  }
}
