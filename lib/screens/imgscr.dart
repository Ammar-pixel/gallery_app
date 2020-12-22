import 'dart:io';
import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key key,
    @required this.imageFile,
  }) : super(key: key);

  final Future<File> imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text('This Image Description',
                  style: TextStyle(fontSize: 22))),
          Text('Location'),
          Text('Filename'),
        ])));
    //body: ListTile(
    //Text('$Icons.description'),
    //),
    //);
  }
}
//color: Colors.black,
//alignment: Alignment.center,
//child: FutureBuilder<File>(
//future: imageFile,
//builder: (_, snapshot) {
//final file = snapshot.data;
// if (file == null) return Container();
// return Image.file(file);
//},

//return ListView(
//  shrinkWrap: true,
// padding: const EdgeInsets.all(20.0),
// children: <Widget>[
//  Text('$Icons.description'),
//  const Text('Domestic life was never quite my style'),
// const Text('When you smile, you knock me out, I fall apart'),
// const Text('And I thought I was so smart'),
// ],
//);
