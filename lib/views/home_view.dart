import 'package:auth_ui/Cubits/get_waether_cubit.dart';
import 'package:auth_ui/Cubits/get_weather_cubit/getWeatherStates.dart';
import 'package:auth_ui/constants/constants.dart';
import 'package:auth_ui/views/searchView.dart';
import 'package:auth_ui/widgets/no_weather_body.dart';
import 'package:auth_ui/widgets/weather_info_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey searchkey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShowCaseWidget.of(context).startShowCase([searchkey]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Showcase(
                descriptionTextAlign: TextAlign.center,
                descTextStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                showArrow: true,
                onTargetClick: () {
                  Future.delayed(Duration.zero, () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const Searchview()),
                    );
                  });
                },
                disposeOnTap: true,
                key: searchkey,
                description: 'Start Search',
                descriptionPadding: const EdgeInsets.all(10),
                child: InkWell(
                  splashColor: kPrimaryColor,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Searchview();
                    }));
                  },
                  child: const Icon(
                    color: Colors.black,
                    Icons.search,
                    size: 30,
                  ),
                ),
              ),
            )
          ],
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Weather App',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<GetWaetherCubit, WeatherState>(
            builder: (context, state) {
          if (state is NoWeatherState) {
            return  NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return  WeatherInfoBody();
          } else
            return  ErorrWidget();
        }));
  }
}

class ErorrWidget extends StatelessWidget {
  const ErorrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset('assets/error.png'),
      const SizedBox(
        height: 10,
      ),
      const Text('Try Later!',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ))
    ]);
  }
}
