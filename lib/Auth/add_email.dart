import 'package:auth_ui/Constants/colors.dart';
import 'package:auth_ui/widgets/customButton.dart';
import 'package:auth_ui/widgets/customCircle.dart';
import 'package:auth_ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart'; // صفحة تسجيل الدخول

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';
  final _formKey = GlobalKey<FormState>();

  Future<void> sendResetEmail() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.sendPasswordResetEmail(email: email);

        // عرض رسالة تأكيد للمستخدم
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reset link sent! Check your email.')),
        );

        // الانتظار لثانيتين ثم الانتقال إلى صفحة اللوجين
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LoginScreen()), // تحويل لصفحة تسجيل الدخول
          );
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCircle(),
            Text(
              textAlign: TextAlign.center,
              'Enter Email',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            Image.asset('assets/Sign in.png'),
            Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: CustomTextField(
                  hintTitle: 'Email',
                  onchanged: (value) => email = value,
                  KeyboardType: TextInputType.emailAddress,
                  validetor: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
            ),
            CustomButton(
              text: 'Send Reset Link',
              onTap: sendResetEmail,
            ),
          ],
        ),
      ),
    );
  }
}
