import 'package:auth_ui/Auth/login_screen.dart';
import 'package:auth_ui/onboarding/first_screen.dart';
import 'package:auth_ui/onboarding/second_screen.dart';
import 'package:auth_ui/onboarding/third_screen.dart';
import 'package:flutter/material.dart';

class Onboardscreen extends StatefulWidget {
  const Onboardscreen({super.key});

  @override
  State<Onboardscreen> createState() => _OnboardscreenState();
}

class _OnboardscreenState extends State<Onboardscreen> {
  final PageController _controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: _controller,
              children: [
                FirstScreen(),
                SecondScreen(),
                ThirdScreen(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIndicator(
                Active: index == 0,
              ),
              SizedBox(
                width: 5,
              ),
              CustomIndicator(
                Active: index == 1,
              ),
              SizedBox(
                width: 5,
              ),
              CustomIndicator(
                Active: index == 2,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    } else {
                      _controller.animateToPage(index - 1,
                          duration: Duration(microseconds: 250),
                          curve: Curves.linear);
                    }
                  },
                  child: Text(
                    index == 2 ? 'Register' : 'Skip',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (index == 2) {
                    } else {
                      _controller.animateToPage(index + 1,
                          duration: Duration(microseconds: 250),
                          curve: Curves.linear);
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 255, 199, 59)),
                      child: Text(
                        index == 2 ? 'Login' : 'Next',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.Active});
  final bool Active;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:
              Active ? const Color.fromARGB(255, 255, 199, 59) : Colors.grey),
      width: Active ? 30 : 10,
      height: 10,
    );
  }
}
