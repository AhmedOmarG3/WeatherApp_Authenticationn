import 'package:auth_ui/Auth/login_screen.dart';
import 'package:auth_ui/Cubits/get_waether_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(
    ShowCaseWidget(
      builder: (context) => const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWaetherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
