import "package:flutter/material.dart";

class DetailPage extends StatelessWidget {
  final video;

  DetailPage(this.video);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Detail Page")),
      body: new Center(
        child: new Text(video["name"]),
      ),
    );
  }
}
