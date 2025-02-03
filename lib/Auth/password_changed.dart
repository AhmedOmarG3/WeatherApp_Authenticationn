import 'package:auth_ui/Constants/colors.dart';
import 'package:auth_ui/widgets/customButton.dart';
import 'package:auth_ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // This will hold the error message if any
  String? _errorMessage;

  // Function to change the password
  Future<void> _changePassword() async {
    String newPassword = _newPasswordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorMessage = 'Both fields are required!';
      });
      return;
    }

    if (newPassword != confirmPassword) {
      setState(() {
        _errorMessage = 'Passwords do not match!';
      });
      return;
    }

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed successfully')),
        );
        Navigator.pop(context); // Go back to the previous screen (e.g., Login)
      } else {
        setState(() {
          _errorMessage = 'User not logged in';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to change password: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _newPasswordController,
              hintTitle: 'New Password',
              obscureText: true,
            ),
            SizedBox(height: 15),
            CustomTextField(
              controller: _confirmPasswordController,
              hintTitle: 'Confirm New Password',
              obscureText: true,
            ),
            SizedBox(height: 15),
            if (_errorMessage != null) 
              Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            SizedBox(height: 15),
            CustomButton(
              text: 'Change Password',
              onTap: _changePassword,
            ),
          ],
        ),
      ),
    );
  }
}
