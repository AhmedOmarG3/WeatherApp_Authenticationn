import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/third.png'),
        Text(
          'Share\n your playlist',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 199, 59)),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
          child: Text(
            'Share your playlist with friends effortlessly.Let others enjoy your favorite tracks',
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
