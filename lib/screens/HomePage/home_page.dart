import 'package:flutter/material.dart';
import 'package:image_list_view/models/sports_model.dart';
import 'package:image_list_view/screens/DetailsPage/details_page.dart';
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'offset: 0',
                style: TextStyle(fontSize: 40.0),
              ),
              Text(
                'limit: 10',
                style: TextStyle(fontSize: 40.0),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text('Details'),
                onPressed: () async {
                  final List<GenericModel> genericModel =
                      await _as.getData(0, 10);

                  setState(() {
                    globalGenericModel = genericModel;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
