import 'package:flutter/material.dart';

class VideoCell extends StatelessWidget {
  final video;

  VideoCell(this.video);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 1.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Image.network(video["imageUrl"]),
              new Container(
                height: 8.0,
              ),
              new Text(video["name"],
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        new Divider(),
      ],
    );
  }
}
