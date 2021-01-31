import 'package:flutter/material.dart';

class ImageListBuilder extends StatelessWidget {
  const ImageListBuilder({
    Key key,
    @required this.images,
  }) : super(key: key);

  final List images;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.network(images[index]),
            ),
          );
        },
      ),
    );
  }
}
