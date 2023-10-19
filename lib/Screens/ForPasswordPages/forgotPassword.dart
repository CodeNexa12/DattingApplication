import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Widgets/Constants.dart';
import '../Widgets/CustomScaffold.dart';
import '../Widgets/widgets.dart';
import 'CodeVerification.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});
  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return CustomScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1,),
              SvgPicture.asset(logo),
              const SizedBox(height: 15,),
              const Text("Forgot Your Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
              const SizedBox(height: 20,),

              const Text("Enter your email and we will send you a code to reset your password.",style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
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
                          return const CodeVerificationScreen();
                        }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Send Code",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
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
}
