import 'dart:convert';

import 'package:animelist/api.dart';
import 'package:animelist/mainItem.dart';
import 'package:animelist/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<MainItem>> _fetchData() async {
    final request = await http.get(Api.topAnime);

    if (request.statusCode == 200) {
      List response = json.decode(request.body)['top'];
      print('aa' + request.body);
      List<MainItem> data = [];

      for (var i = 0; i < response.length; i++) {
        data.add(MainItem(
            model: Model(
          response[i]['malId'],
          response[i]['rank'],
          response[i]['title'],
          response[i]['url'],
          response[i]['imageUrl'],
          response[i]['type'],
          response[i]['episodes'],
          response[i]['startDate'],
          response[i]['endDate'],
          response[i]['members'],
          response[i]['score'].round(),
        )));
      }
      return data;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter MyAnimeList'),
      ),
      body: FutureBuilder(
          future: _fetchData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return loadingPage();
              case ConnectionState.waiting:
                return loadingPage();
              case ConnectionState.none:
                return loadingPage();
              case ConnectionState.none:
                return loadingPage();
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return homePage(snapshot.data);
                } else if (snapshot.hasError) {
                  return errorPage(context, snapshot);
                } else {
                  return errorPage(context, snapshot);
                }
                break;
              default:
            }
          }),
    );
  }

  Widget loadingPage() => Center(
        child: CircularProgressIndicator(backgroundColor: Colors.blue),
      );

  Widget errorPage(context, snapshot) => Center(
        child: Column(
          children: <Widget>[
            Text('Gagal Mendapatkan Data'),
            RaisedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('TRY AGAIN'),
            )
          ],
        ),
      );

  Widget homePage(List<MainItem> anime) => ListView.builder(
        itemCount: anime.length,
        itemBuilder: (context, index) => anime[index],
      );
}
