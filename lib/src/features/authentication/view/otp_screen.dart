import 'package:astha_agent/src/widget/button.dart';
import 'package:astha_agent/src/widget/cutom_tabbar.dart';
import 'package:astha_agent/src/widget/otp_textfield.dart';
import 'package:astha_agent/utils/colors.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                  child: Column(children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "ReadexPro",
                      fontSize: 28,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Please login to continue",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "ReadexPro",
                      color: Colors.white),
                ),
              ])),
              const SizedBox(
                child: Image(image: AssetImage("assets/images/otpimage.png")),
              ),
              const OTPfield(),
              const Center(
                child: Text(
                  "Not received? Send again",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "ReadexPro",
                      color: Colors.white),
                ),
              ),
              CutomButtom(
                onTap: () {
                  showSuccessDialog(context);
                },
                text: "Verify OTP",
                color: primaryColor,
                textColor: Colors.white,
                borderColor: Colors.white,
                radius: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Success',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: "ReadexPro"),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Your OTP has been verified successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, fontFamily: "ReadexPro"),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    print("object");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const MainScreen()));
                    // Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Login',
                    style:
                        TextStyle(color: Colors.white, fontFamily: "ReadexPro"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
