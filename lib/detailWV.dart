import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Detail extends StatelessWidget {
  String url;
  Detail({@required this.url});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
              url: url,
              appBar: new AppBar(
                title: new Text("AnimeList Flutter"),
              ),
            ),
      },
    );
  }
}
