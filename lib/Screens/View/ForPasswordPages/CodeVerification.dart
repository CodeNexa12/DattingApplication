import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Widgets/Constants.dart';
import '../../../Widgets/CustomScaffold.dart';
import '../../../Widgets/widgets.dart';
import 'ResetPassword.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});
  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
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
              const Text("Code verification",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
              const SizedBox(height: 20,),

              const Text("Enter security code that we sent to your email id itika21real@gmail.com.",style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
              const SizedBox(height: 30,),
              SizedBox(
                width: screenWidth * 0.8,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Code",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),textAlign: TextAlign.left,),
                    SizedBox(height: 10,),
                    textField("1234",true),
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
                          return const ResetPasswordPage();
                        }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //       return const SignUpEmail();
                  //     }));
                },
                child: RichText(
                  text:  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Didn’t get a code? ',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: buttonColor,
                        ),
                      ),
                    ],
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
