import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rest_api_cuaca/models/weather_model.dart';
import 'package:rest_api_cuaca/service/api.dart';

final airData = FutureProvider<WeatherModel>((ref) async => panggilCuaca());
