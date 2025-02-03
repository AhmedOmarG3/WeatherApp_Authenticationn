import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/weather2.png',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/search_icon.png',
                  height: 200,
                  width: 300,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
