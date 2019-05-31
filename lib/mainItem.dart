import 'package:animelist/detailWV.dart';
import 'package:animelist/model.dart';
import 'package:flutter/material.dart';

class MainItem extends StatefulWidget {
  final Model model;
  MainItem({this.model, Key key}) : super(key: key);

  @override
  _MainItemState createState() => _MainItemState(model);
}

class _MainItemState extends State<MainItem> {
  final Model model;
  _MainItemState(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detail(
                        url: model.url,
                      )));
        },
        child: Card(
            child: CustomWidget(
          image: model.imageUrl,
          episode: model.episodes.toString(),
          title: model.title,
          type: model.type,
          startDate: model.startDate,
          endDate: model.endDate == null ? 'n/a' : model.endDate,
        )),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  String image, title, type, episode, startDate, endDate;
  CustomWidget(
      {this.image,
      this.title,
      this.type,
      this.episode,
      this.startDate,
      this.endDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'img/narusuke.gif',
                  image: image,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              )),
          SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Text(type),
                Text(episode),
                Text(startDate + "-" + endDate)
              ],
            ),
          )
        ],
      ),
    );
  }
}
