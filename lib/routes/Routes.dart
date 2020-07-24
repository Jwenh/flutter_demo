import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/News.dart';

final routes = {'/': (context) => Tabs(), '/news': (context) => NewsPage()};
//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name; // 路由路径 '/'
  final Function pageContentBuilder = routes[name]; // 路径对应的方法
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      //路由有arguments传参
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
