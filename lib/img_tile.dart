import 'package:gallery_app/image.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  final Img img;
  ImageTile({this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
          ),
          title: Text(img.time),
          subtitle: Text('${img.desc}'),
        ),
      ),
    );
  }
}
