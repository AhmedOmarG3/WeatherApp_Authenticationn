import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/second.png'),
        Text(
          'Listining to\n music offline',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 199, 59)),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
          child: Text(
            'Listening to music offline .Enjoy your favorite tracks without  internet',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 19, 54, 33)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
    ;
  }
}
