import 'package:astha_agent/src/controllers/login/login_bloc.dart';
import 'package:astha_agent/src/features/authentication/view/otp_screen.dart';
import 'package:astha_agent/src/widget/button.dart';
import 'package:astha_agent/src/widget/textfield.dart';
import 'package:astha_agent/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)),
                    width: 80,
                    height: 80,
                    child: const Image(
                        image: AssetImage("assets/images/logo.png")),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
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
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Container(
                  // alignment: Alignment.,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: CutomTextfield(
                                text: "Enter the email id or phone number"),
                          ),
                          const CutomTextfield(text: "Enter password"),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: SizedBox(
                              child: BlocConsumer<LoginBloc, LoginState>(
                                listener: (context, state) {
                                  if (state is LoginLoadingState) {
                                    isLoading = true;
                                  } else if (state is LoginErrorState) {
                                    isLoading = false;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(state.message)));
                                  } else {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const OtpScreen()));
                                  }
                                },
                                builder: (context, state) {
                                  return CutomButtom(
                                    onTap: () {
                                      context.read<LoginBloc>().add(
                                          LoginClickEvent(
                                              email: 'email',
                                              password: 'password'));
                                    },
                                    text: "Login",
                                    color: primaryColor,
                                    borderColor: primaryColor,
                                    textColor: Colors.white,
                                    radius: 30,
                                  );
                                },
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 58.0),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "ReadexPro",
                                  color: primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context
          .read<LoginBloc>()
          .add(LoginClickEvent(email: 'email', password: 'password'));
    }
  }
}
