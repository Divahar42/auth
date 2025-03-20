import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String? _verificationId;

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text,
      timeout: Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
        // Navigate to the home screen if authentication is successful
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle the error
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
        // Ask the user to input the OTP
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Enter OTP"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: _otpController),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _signInWithOTP,
                    child: Text('Verify'),
                  ),
                ],
              ),
            );
          },
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> _signInWithOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: _otpController.text,
    );
    await _auth.signInWithCredential(credential);
    // Navigate to the home screen if authentication is successful
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Auth"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            ElevatedButton(
              onPressed: _verifyPhoneNumber,
              child: Text('Verify Phone Number'),
            ),
          ],
        ),
      ),
    );
  }
}
