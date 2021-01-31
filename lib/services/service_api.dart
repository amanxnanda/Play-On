import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:image_list_view/models/sports_model.dart';

class ApiService {
  String baseURL =
      'http://playonnuat-env.eba-ernpdw3w.ap-south-1.elasticbeanstalk.com/api/v1/establishment/test/list?';

  Future<List<GenericModel>> getData(int offset, int limit) async {
    http.Response response =
        await http.get('${baseURL}offset=$offset&limit=$limit');

    return genericModelFromJson(response.body);
  }
}
