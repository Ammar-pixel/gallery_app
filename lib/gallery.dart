import 'package:flutter/material.dart';
import 'package:gallery_app/screens/assetTNail.dart';
import 'package:gallery_app/screens/imgscr.dart';
import 'package:gallery_app/second_page.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  var storage = FirebaseStorage.instance;
  List<AssetImage> listOfImage;
  bool clicked = false;
  List<String> listOfStr = List();
  String images;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery Demo"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              itemCount: listOfImage.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Material(
                    child: GestureDetector(
                        child: Stack(children: <Widget>[
                          this.images == listOfImage[index].assetName ||
                                  listOfStr
                                      .contains(listOfImage[index].assetName)
                              ? Positioned.fill(
                                  child: Opacity(
                                  opacity: 0.7,
                                  child: Image.asset(
                                    listOfImage[index].assetName,
                                    fit: BoxFit.fill,
                                  ),
                                ))
                              : Positioned.fill(
                                  child: Opacity(
                                  opacity: 1.0,
                                  child: Image.asset(
                                    listOfImage[index].assetName,
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          this.images == listOfImage[index].assetName ||
                                  listOfStr
                                      .contains(listOfImage[index].assetName)
                              ? Positioned(
                                  left: 0,
                                  bottom: 0,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ))
                              : Visibility(
                                  visible: false,
                                  child: Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.black,
                                  ),
                                )
                        ]),
                        onTap: () {
                          setState(() {
                            if (listOfStr
                                .contains(listOfImage[index].assetName)) {
                              this.clicked = false;
                              listOfStr.remove(listOfImage[index].assetName);
                              this.images = null;
                            } else {
                              this.images = listOfImage[index].assetName;
                              listOfStr.add(this.images);
                              this.clicked = true;
                            }
                          });
                        },
                        onDoubleTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageScreen(
                                      imageFile: null,
                                    )),
                          );
                        }),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Upload Images"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
            ),
            isLoading
                ? CircularProgressIndicator()
                : Visibility(visible: false, child: Text("test")),
          ],
        ),
      ),
    );
  }

  void getImages() {
    listOfImage = List();
    for (int i = 0; i < 6; i++) {
      listOfImage.add(AssetImage('assets/pic' + i.toString() + '.png'));
    }
  }
}
