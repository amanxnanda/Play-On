import 'package:flutter/material.dart';
import 'package:image_list_view/models/sports_model.dart';
import 'package:image_list_view/services/service_api.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService _as = ApiService();

  List<GenericModel> _genericModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play ON'),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              final List<GenericModel> genericModel = await _as.getData(0, 10);

              setState(() {
                _genericModel = genericModel;
              });

              print(_genericModel);
            },
          ),
        ),
      ),
    );
  }
}
