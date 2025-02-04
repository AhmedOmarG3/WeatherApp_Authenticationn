import 'package:auth_ui/Auth/login_screen.dart';
import 'package:auth_ui/Constants/colors.dart';

import 'package:auth_ui/widgets/customButton.dart';
import 'package:auth_ui/widgets/customCircle.dart';
import 'package:auth_ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  
  String name = '';
  String username = ''; // This is email
  String password = '';
  String confirmPassword = '';

  final _formKey = GlobalKey<FormState>();  // Add form key for validation


  Future<void> register() async {
  if (_formKey.currentState!.validate()) {  // Validate all fields
    if (password == confirmPassword) {
      try {
        
        await _auth.createUserWithEmailAndPassword(email: username, password: password);
        
      
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      } catch (e) {
        print('Error: $e');
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to register: $e')),
          );
        }
      }
    } else {
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
        );
      }
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,  // Wrap the form with a Form widget
        child: SingleChildScrollView(keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SizedBox(height: MediaQuery.of(context).size.height,
            child: Column(mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCircle(),
                Text(
                  textAlign: TextAlign.center,
                  'Register',
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: primaryColor),
                ),
                Expanded(flex: 4, child: Image.asset('assets/Sign in.png')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: CustomTextField(
                    hintTitle: 'Name',
                    onchanged: (value) => name = value,
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: CustomTextField(
                    hintTitle: 'User name (Email)',
                    onchanged: (value) => username = value,
                   
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: CustomTextField(
                    onchanged: (value) => password = value,
                    hintTitle: 'Password',
                    obscureText: true,
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: CustomTextField(
                    hintTitle: 'Confirm Password',
                    obscureText: true,
                    onchanged: (value) => confirmPassword = value,
                    
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomButton(
                  text: 'Register',
                  onTap: register,  
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " have an account?",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        " Sign in",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
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
                            shape: BoxShape.circle),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
