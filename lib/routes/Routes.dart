import 'dart:js';

import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/News.dart';
import '../pages/NewsContent.dart';
import '../pages/Device.dart';
import '../pages/ChewieVideo.dart';
import '../pages/NetworkPage.dart';
import '../pages/StoragePage.dart';

//配置路由
final routes = {
  '/': (context) => Tabs(),
  '/news': (context) => NewsPage(),
  '/newscontent': (context, {arguments}) => NewsContent(arguments: arguments),
  '/device': (context) => DevicePage(),
  '/chewieVideo': (context) => ChewieVideo(),
  '/network': (context) => NetworkPage(),
  '/storage': (context) => StoragePage()
};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  print(settings);
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
