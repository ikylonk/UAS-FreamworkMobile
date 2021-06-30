import 'dart:convert';

import 'package:rest_api_cuaca/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_cuaca/utils/environment.dart';

Future<WeatherModel> panggilCuaca() async {
  final response = await http.get(urlAPI +
      'v2/city?city=Jakarta&state=Jakarta&country=Indonesia&key=' +
      keyAPI);
  if (response.statusCode == 200) {
    var res = json.decode(response.body);
    return WeatherModel.fromJson(res);
  } else {
    throw Exception('Tidak dapat data');
  }
}
