import 'package:flutter/material.dart';

import '../HomePage/home_page.dart';
import 'list_builder_image.dart';

// ignore: must_be_immutable
class ImagePage extends StatefulWidget {
  final int index;
  List _images;

  ImagePage({this.index}) {
    this._images = globalGenericModel[index].images;
  }

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Page"),
      ),
      body: widget._images == null
          ? Container(
              child: Center(
                child: Text('No Images'),
              ),
            )
          : ImageListBuilder(images: widget._images),
    );
  }
}
