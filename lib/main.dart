import 'dart:convert';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/unsplash_model.dart';
import 'toast_utils.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Awesome App',
        theme: ThemeData(primarySwatch: Colors.blue),
        navigatorObservers: [BotToastNavigatorObserver()],
        builder: BotToastInit(),
        home: MyHomePage(title: 'Awesome App'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<UnSplashModel> items = [];
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool _isFetching = true;

  fetchProducts() async {
    try {
      final SharedPreferences prefs = await _prefs;

      setState(() {
        _isFetching = true;
        items.clear();
      });

      if (prefs.getString('data') != null) {
        List<dynamic> list = json.decode(prefs.getString('data').toString());
        for (int i = 0; i < list.length; i++) {
          setState(() {
            items.add(UnSplashModel.fromJson(list[i]));
          });
        }
      }

      //check for internet connection
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Dio dio = new Dio();
        dio.options.headers["Authorization"] =
            "Client-ID N_sLL516R-J1Lb91_rkJshfo2wJjznxO5SjtdCwV9Q8";

        var response =
            await dio.get('https://api.unsplash.com/photos/random?count=30');

        if (response.statusCode == 200) {
          List<dynamic> list = response.data;
          items.clear();
          for (int i = 0; i < list.length; i++) {
            setState(() {
              items.add(UnSplashModel.fromJson(list[i]));
            });
          }
          await prefs
              .setString('data', json.encode(response.data))
              .then((value) {
            setState(() {
              _isFetching = false;
            });
          });
        } else {
          setState(() {
            _isFetching = false;
          });
          ToastUtils.showFailed(message: 'Response : ${response.statusCode}');
        }
      } else {
        ToastUtils.showFailed(message: 'No internet connection');
      }
    } on SocketException catch (e) {
      setState(() {
        _isFetching = false;
      });
      ToastUtils.showFailed(message: 'No internet connection');
    } on DioError catch (e) {
      setState(() {
        _isFetching = false;
      });
      ToastUtils.showFailed(message: e.message);
    }
  }

  Future _fetchData() async {
    await fetchProducts();
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: RefreshIndicator(
            onRefresh: _fetchData,
            child: _isFetching
                ? Center(child: CircularProgressIndicator())
                : items.isNotEmpty
                    ? ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ProductBox(item: items[index]);
                        })
                    : Center(
                        child: Text('No Data Found'),
                      )));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({required this.item});

  final UnSplashModel item;

  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: EdgeInsets.all(16),
            child: Row(children: <Widget>[
              GestureDetector(
                  onTap: () {
                    _openImageInBrowser(item.urls!.full);
                  },
                  child: CachedNetworkImage(
                      imageUrl: item.urls!.thumb,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Padding(
                              padding: const EdgeInsets.all(32),
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover)),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(item.description),
                    SizedBox(height: 10),
                    Text(
                        'Author: ${item.user!.firstName} ${item.user!.firstName}')
                  ]))
            ])));
  }

  void _openImageInBrowser(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : ToastUtils.showFailed(message: 'Could not launch $_url');
}
