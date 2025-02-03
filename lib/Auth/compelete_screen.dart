import 'package:auth_ui/Auth/login_screen.dart';
import 'package:auth_ui/Constants/colors.dart';
import 'package:auth_ui/views/home_view.dart';
import 'package:auth_ui/widgets/customButton.dart';
import 'package:flutter/material.dart';

class CompeleteScreen extends StatelessWidget {
  const CompeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Account Created',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/complete.png'),
              Text(
                'Hi There,                             ',
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Complete your profile to get a\n personalized feeds',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: 'Go to App',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeView()));
                },
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: primaryColor,
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
