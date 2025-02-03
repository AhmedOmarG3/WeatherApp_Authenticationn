import 'package:auth_ui/Auth/compelete_screen.dart';
import 'package:auth_ui/Constants/colors.dart';
import 'package:auth_ui/widgets/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_field_style_v2.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  
  const OtpScreen({super.key, required this.verificationId});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String otpCode;

  // Function to verify OTP and sign in
  Future<void> verifyOtp(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Verification successful!')),
      );

      // Navigate to the next screen after successful verification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CompeleteScreen()),
      );
    } catch (e) {
      print('Error verifying OTP: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

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
                    SizedBox(width: 10),
                    Text(
                      'OTP Verification',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Image.asset('assets/OTP.png'),
              Text(
                'Enter the OTP sent to your phone',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: OTPTextFieldV2(
                  controller: OtpFieldControllerV2(),
                  length: 6,
                  spaceBetween: 10,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: primaryColor,
                    enabledBorderColor: primaryColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.underline,
                  outlineBorderRadius: 15,
                  style: TextStyle(fontSize: 17),
                  onChanged: (pin) {
                    otpCode = pin;
                  },
                  onCompleted: (pin) {
                    otpCode = pin;
                    verifyOtp(otpCode);
                  },
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Verify',
                onTap: () {
                  verifyOtp(otpCode);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
