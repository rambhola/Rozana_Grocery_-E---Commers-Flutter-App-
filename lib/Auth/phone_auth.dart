
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'otp_screen.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: Image.asset('assets/icon/login_icon.png', scale: 2),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("Login", style: TextStyle(fontSize: 30)),
            ),
            const SizedBox(height: 7),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "enter your mobile number ",
                style: TextStyle(fontSize: 20),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "+91999999999",
                  labelText: 'Phone Number',

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: _showError ? Colors.red : Colors.green,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: _showError ? Colors.red : Colors.deepPurple,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            if (_showError)
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 8),
                child: Text(
                  "Phone number cannot be empty",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),

            const SizedBox(height: 57),

            Container(
              height: 65.h,
              width: 350.w,
              margin: const EdgeInsets.only(left: 25,right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xFF00A86B),
              ),
              child: TextButton(
                onPressed: () async {
                  // Validation check
                  if (phoneController.text.trim().isEmpty) {
                    setState(() {
                      _showError = true;
                    });
                    return; // Stop execution if empty
                  } else {
                    setState(() {
                      _showError = false;
                    });
                  }

                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91${phoneController.text.trim()}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              OtpScreen(verificationId: verificationId),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
