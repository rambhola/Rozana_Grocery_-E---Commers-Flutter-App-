

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../repository/Screens/Navbar/bottom_navbar.dart';
import '../repository/widgets/ui_helper.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  final FocusNode _focus = FocusNode();

  String d1 = "", d2 = "", d3 = "", d4 = "", d5 = "", d6 = "";

  @override
  void initState() {
    super.initState();
    otpController.addListener(() {
      String text = otpController.text;
      d1 = text.length > 0 ? text[0] : "";
      d2 = text.length > 1 ? text[1] : "";
      d3 = text.length > 2 ? text[2] : "";
      d4 = text.length > 3 ? text[3] : "";
      d5 = text.length > 4 ? text[4] : "";
      d6 = text.length > 5 ? text[5] : "";
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _focus.requestFocus());
  }

  @override
  void dispose() {
    otpController.dispose();
    _focus.dispose();
    super.dispose();
  }


  void _setCursorTo(int index) {
    final pos = index.clamp(0, otpController.text.length);
    otpController.selection = TextSelection.collapsed(offset: pos);
    _focus.requestFocus();
  }

  void _deleteAt(int index) {
    String text = otpController.text;
    if (index >= 0 && index < text.length) {
      final newText = StringBuffer();
      for (int i = 0; i < text.length; i++) {
        if (i != index) newText.write(text[i]);
      }
      otpController.text = newText.toString();
      otpController.selection = TextSelection.collapsed(offset: index);
      _focus.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 33),
              const Text(
                "Verification Code",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 80),
              UiHelper.customText(
                text: "We have sent the verification code to your\nPhone Number",
                color: Colors.grey.shade400,
                fontweight: FontWeight.bold,
                fontsize: 16,
              ),
              UiHelper.customText(
                text: "Phone Number",
                color: Colors.grey.shade400,
                fontweight: FontWeight.bold,
                fontsize: 18,
              ),

              const SizedBox(height: 250),

              // 🔹 Same row (UI untouched)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _setCursorTo(0),
                      onLongPress: () => _deleteAt(0),
                      child: _otpBox(d1),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => _setCursorTo(1),
                      onLongPress: () => _deleteAt(1),
                      child: _otpBox(d2),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => _setCursorTo(2),
                      onLongPress: () => _deleteAt(2),
                      child: _otpBox(d3),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => _setCursorTo(3),
                      onLongPress: () => _deleteAt(3),
                      child: _otpBox(d4),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => _setCursorTo(4),
                      onLongPress: () => _deleteAt(4),
                      child: _otpBox(d5),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => _setCursorTo(5),
                      onLongPress: () => _deleteAt(5),
                      child: _otpBox(d6),
                    ),
                  ],
                ),
              ),

              // Hidden TextField (unchanged)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  controller: otpController,
                  focusNode: _focus,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: const InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(
                      color: Colors.transparent, height: 0.1, fontSize: 1),
                  cursorColor: Colors.transparent,
                  autofocus: true,
                ),
              ),

              const SizedBox(height: 30),
              Center(
                child: Container(
                  height: 65,
                  width: 350,
                 // margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xFF00A86B),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      String otp = otpController.text.trim();
                      if (otp.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter OTP')),
                        );
                        return;
                      }

                      try {
                        PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: otp,
                        );

                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavbar()),
                        );
                      } on FirebaseAuthException catch (ex) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${ex.message}')),
                        );
                      } catch (ex) {
                        print('Error: $ex');
                      }
                    },
                    child: const Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBox(String value) {
    return Container(
      height: 65.h,
      width: 52.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Text(value, style: const TextStyle(fontSize: 20)),
    );
  }
}
