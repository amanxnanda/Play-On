import 'package:flutter/material.dart';
import 'package:image_list_view/constant/constants.dart';
import 'package:image_list_view/models/sports_model.dart';
import 'package:image_list_view/screens/HomePage/home_page.dart';
import 'package:image_list_view/screens/ImagePage/image_page.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<GenericModel> _details = globalGenericModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Container(
        decoration: kBboxDecoration,
        child: ListView.builder(
          itemCount: _details.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading:
                      Image.network('${_details[index].sports.iconBlackUrl}'),
                  title: Text('${_details[index].name}'),
                  subtitle: Text('${_details[index].sports.name}'),
                  trailing: Text('₹ ${_details[index].costPerSlot}'),
                  onTap: () {
                    print(_details[index].images);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImagePage(index: index),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
