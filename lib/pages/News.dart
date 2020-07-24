import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List _list = [];
  int _page = 1;
  bool hasMore = true;
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();

    //添加滚动事件
    _scrollController.addListener(() {
      // print(_scrollController.position.pixels); //获取下拉的距离
      // print(_scrollController.position.maxScrollExtent); //获取整个页面的高度
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 40) {
        this._getData();
      }
    });
  }

  void _getData() async {
    if (this.hasMore) {
      var apiUrl =
          'http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}';
      var response = await Dio().get(apiUrl);
      var res = json.decode(response.data)['result'];
      setState(() {
        this._list.addAll(res);
        this._page++;
      });
      //是不是最后一页
      if (res.length < 20) {
        setState(() {
          this.hasMore = false;
        });
      }
    }
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      print('请求数据完成');
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('新闻列表'),
        ),
        body: this._list.length > 0
            ? RefreshIndicator(
                onRefresh: this._onRefresh,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: this._list.length,
                    itemBuilder: (context, index) {
                      if (index == this._list.length - 1) {
                        //列表渲染到最后一条的时候加一个圈圈
                        return Column(
                          children: <Widget>[
                            ListTile(
                                title: Text(
                              '${this._list[index]["title"]}',
                              maxLines: 1,
                            )),
                            Divider(),
                            _getMoreWidget()
                          ],
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            ListTile(
                                title: Text(
                              "${this._list[index]['title']}",
                              maxLines: 1,
                            )),
                            Divider()
                          ],
                        );
                      }
                    }),
              )
            : _getMoreWidget());
  }

  //加载中的圈圈
  Widget _getMoreWidget() {
    if (hasMore) {
      return Center(
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('加载中...', style: TextStyle(fontSize: 16.0)),
                  CircularProgressIndicator(strokeWidth: 1.0)
                ],
              )));
    } else {
      return Center(
        child: Text('--我是有底线的--'),
      );
    }
  }
}
