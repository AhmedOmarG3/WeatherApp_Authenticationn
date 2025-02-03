import 'package:auth_ui/Models/weatherModel.dart';
import 'package:dio/dio.dart';

class Weatherservice {
  final Dio dio;
  final String apiKey = 'b4a8116f3f674c5596c215135252601';
  final String baseUrl = 'http://api.weatherapi.com/v1';
  Weatherservice(this.dio);

  Future<Weathermodel> getWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      Weathermodel weathermodel = Weathermodel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessege = e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errorMessege);
    } catch (e) {
      throw Exception('oops there was an error , try later');
    }
  }
}
