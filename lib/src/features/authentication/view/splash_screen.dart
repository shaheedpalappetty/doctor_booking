
import 'package:astha_agent/src/features/authentication/view/login_screen.dart';
import 'package:astha_agent/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return  LoginScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image(image: AssetImage("assets/images/logo.png")),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "ASTHA",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "ReadexPro",
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
