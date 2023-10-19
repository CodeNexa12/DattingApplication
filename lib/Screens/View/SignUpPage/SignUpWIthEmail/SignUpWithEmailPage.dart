import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Widgets/Constants.dart';
import '../../../../Widgets/CustomScaffold.dart';
import '../../../../Widgets/widgets.dart';

import '../../LoginPage/LoginPage.dart';

import '../ProfileDetails/profileDetails.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({super.key});
  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
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
              SizedBox(height: screenHeight * 0.06,),
              SvgPicture.asset(logo),
              const SizedBox(height: 15,),
              const Text("Create new account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
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
                    const Text("Phone",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    textField("phone",true),
                    const SizedBox(height: 20,),
                    const Text("Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    textField("*****"),
                    const SizedBox(height: 20,),
                    const Text("Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    textField("*****"),
                    const SizedBox(height: 20,),

                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 0.8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const ProfileDetails();
                        }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Create an Account",
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
                        return const LoginScreen();
                      }));
                },
                child: RichText(
                  text:  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
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
