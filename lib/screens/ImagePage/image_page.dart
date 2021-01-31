import 'package:flutter/material.dart';

import '../HomePage/home_page.dart';
import 'list_builder_image.dart';

class ImagePage extends StatefulWidget {
  ImagePage({Key key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  List _images = globalGenericModel[0].images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Page"),
      ),
      body: ImageListBuilder(images: _images),
    );
  }
}
