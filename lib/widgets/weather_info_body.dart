import 'package:auth_ui/Cubits/get_waether_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weathetmodel = BlocProvider.of<GetWaetherCubit>(context).weatherModel;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/weather1.png',
              height: 300,
            ),
            Text(
              weathetmodel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weathetmodel.date.hour}:${weathetmodel.date.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weathetmodel.image.contains('https:')
                      ? weathetmodel.image
                      : 'https:${weathetmodel.image}',
                ),
                Text(
                  '${weathetmodel.temp}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weathetmodel.maxTemp}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Mintemp: ${weathetmodel.minTemp}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weathetmodel.weatherState,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
