import 'package:auth_ui/Cubits/get_weather_cubit/getWeatherStates.dart';
import 'package:auth_ui/Models/weatherModel.dart';
import 'package:auth_ui/Servicies/weather_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetWaetherCubit extends Cubit<WeatherState> {
  GetWaetherCubit() : super(NoWeatherState());
  late Weathermodel weatherModel;
  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await Weatherservice(Dio()).getWeather(cityName: cityName);
      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFailerState());
    }
  }
}
