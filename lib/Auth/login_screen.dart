import 'package:auth_ui/Auth/RegisterScreen.dart';
import 'package:auth_ui/Auth/add_email.dart';
import 'package:auth_ui/Auth/compelete_screen.dart';
import 'package:auth_ui/Auth/otp_screen.dart';
import 'package:auth_ui/Constants/colors.dart';
import 'package:auth_ui/views/home_view.dart';
import 'package:auth_ui/widgets/customButton.dart';
import 'package:auth_ui/widgets/customCircle.dart';
import 'package:auth_ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Variables for storing input values
  String email = '';
  String name_of_user = 'User';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  // Sign in function
  Future<void> signIn() async {
    if (_formKey.currentState!.validate()) {
      // Check if email and password are not empty
      if (email.isEmpty || password.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Please enter both email and password')),
          );
        }
        return;
      }

      try {
        // Sign in with Firebase Auth
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        // Navigate to HomeView after successful sign-in
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CompeleteScreen()),
          );
        }
      } catch (e) {
        print('Error: $e');
        // Check for specific Firebase error messages
        String errorMessage = 'Failed to sign in. Please try again later.';
        if (e is FirebaseAuthException) {
          // FirebaseAuthException provides specific error codes
          if (e.code == 'user-not-found') {
            errorMessage = 'No user found with this email.';
          } else if (e.code == 'wrong-password') {
            errorMessage = 'Incorrect password.';
          } else if (e.code == 'invalid-email') {
            errorMessage = 'The email address is not valid.';
          }
        }
        // Show appropriate error message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomCircle(),
              Text(
                textAlign: TextAlign.center,
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Image.asset(
                'assets/Sign in.png',
                height: 100,
              ),

              // Form widget with validation
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: CustomTextField(
                        hintTitle: 'Email',
                        onchanged: (value) => email = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: CustomTextField(
                        hintTitle: 'Password',
                        obscureText: true,
                        onchanged: (value) => password = value,
                      ),
                    ),
                    SizedBox(height: 15),
                    // "Forgot Password" link under the password field
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EmailScreen()), // Replace with actual OTP page
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: Colors.red[400],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),

              // Login Button
              CustomButton(
                text: 'Login',
                onTap: signIn,
              ),
              SizedBox(height: 5),

              // Or login with social media buttons
              Text(
                ' Or Login with',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/facbook.png', height: 70, width: 70),
                  SizedBox(width: 5),
                  Image.asset('assets/gmail.png', height: 50, width: 50),
                  SizedBox(width: 5),
                  Image.asset('assets/twitter.png', height: 70, width: 100),
                ],
              ),
              SizedBox(height: 5),

              // Navigate to the registration screen if the user doesn't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                height: 70,
                width: width(context),
                child: Stack(alignment: Alignment.bottomLeft, children: [
                  Positioned(
                    bottom: -40,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
