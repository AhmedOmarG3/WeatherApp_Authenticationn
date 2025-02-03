import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/one.png'),
        Text(
          'No ads while\nlistening music',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 199, 59)),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
          child: Text(
            'Listining to music is very comfortable without any annoying ads',
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 19, 54, 33)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
