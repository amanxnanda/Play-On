import 'package:flutter/material.dart';
import 'package:image_list_view/models/sports_model.dart';
import 'package:image_list_view/services/service_api.dart';

List<GenericModel> globalGenericModel;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService _as = ApiService();

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
            child: Text('Images'),
            onPressed: () async {
              final List<GenericModel> genericModel = await _as.getData(0, 10);

              setState(() {
                globalGenericModel = genericModel;
              });
              Navigator.pushNamed(context, '/second');
              print(globalGenericModel);
            },
          ),
        ),
      ),
    );
  }
}
