import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/Constants.dart';
import '../../../Widgets/CustomScaffold.dart';
import '../../../Widgets/widgets.dart';
import '../ForPasswordPages/forgotPassword.dart';
import '../HomePages/HomePage.dart';
import '../SignUpPage/SignUpWIthEmail/SignUpWithEmailPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1,),
              SvgPicture.asset(logo),
              const SizedBox(height: 15,),
              const Text("Welcome to login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
              const SizedBox(height: 20,),

              const Text("Please fill out the below details to create your new account.",style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
              const SizedBox(height: 30,),
              SizedBox(
                width: screenWidth * 0.8,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    textField("email"),
                    const SizedBox(height: 20,),

                    const Text("Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    textField("*****"),
                    Align(
                      alignment: Alignment.bottomRight,
                        child: TextButton(onPressed: (){

                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return const ForgotScreen();
                              }));
                        }, child: Text("Forgot Password?",style: TextStyle(color: buttonColor),))),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
              const SizedBox(height: 20,),

              SizedBox(
                width: screenWidth * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const HomePage();
                        }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const SignUpEmail();
                          }));
                },
                child: RichText(
                  text:  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      TextSpan(
                        text: 'SignUp',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: buttonColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20,),




            ],
          ),
        ),
      ),

    );
  }
}
