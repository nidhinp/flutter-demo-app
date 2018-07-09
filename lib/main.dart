import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './views/video_cell.dart';
import './screens/detail_page.dart';

void main() => runApp(new RealWorldApp());

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RealWorldState();
  }
}

class RealWorldState extends State<RealWorldApp> {
  var _isLoading = true;
  var videos;

  _fetchData() async {
    final url = "https://api.letsbuildthatapp.com/youtube/home_feed";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final videosJson = map["videos"];

      setState(() {
        _isLoading = false;
        this.videos = videosJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("REAL WORLD APP BAR"),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _fetchData();
              },
            )
          ],
        ),
        body: new Center(
            child: _isLoading
                ? new CircularProgressIndicator()
                : new ListView.builder(
                    itemCount: this.videos == null ? 0 : this.videos.length,
                    itemBuilder: (context, i) {
                      final video = this.videos[i];
                      return new FlatButton(
                        padding: EdgeInsets.all(0.0),
                        child: new VideoCell(video),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new DetailPage(video)));
                        },
                      );
                    },
                  )),
      ),
    );
  }
}
