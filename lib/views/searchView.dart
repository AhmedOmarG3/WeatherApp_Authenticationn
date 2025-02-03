import 'package:auth_ui/Cubits/get_waether_cubit.dart';
import 'package:auth_ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Search a City',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/search.png',
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: TextField(
                onSubmitted: (value) async {
                  var weatherCubit = BlocProvider.of<GetWaetherCubit>(context);
                  weatherCubit.getWeather(cityName: value);
                  Navigator.pop(context);
                },
                style: const TextStyle(fontSize: 25),
                decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle:
                        const TextStyle(fontSize: 25, color: Colors.black),
                    suffix: const Icon(
                      Icons.search,
                    ),
                    hintText: 'Enter City',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
