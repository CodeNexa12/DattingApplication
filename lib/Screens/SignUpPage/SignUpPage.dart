import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Widgets/Constants.dart';
import '../Widgets/CustomScaffold.dart';
import 'SignUpWIthEmail/SignUpWithEmailPage.dart';
import 'SignUpWithPhone.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return CustomScaffold(
      body:
         Column(
          children: [
             SizedBox(height: screenHeight * 0.1,),
            SvgPicture.asset(logo),
            const SizedBox(height: 50,),
            const Text("Sign up to continue ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 60,
                width: screenWidth * 0.8,

                child: ElevatedButton(
                  onPressed: () {
                    // Add your button action here
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                      return const SignUpEmail();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                      side:  BorderSide(
                        color: buttonColor,
                        width: 2.0, // Border width
                      ),
                    ), backgroundColor: const Color(0xff112220), // Button background color
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      "Continue with email",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 60,
                width: screenWidth * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return const SignUpPhone();
                      }));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                      side:  BorderSide(
                        color: buttonColor,
                        width: 2.0, // Border width
                      ),
                    ), backgroundColor: const Color(0xff112220), // Button background color
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 24.0,
                    ),
                    child: Text(
                      "Use phone number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth* 0.3,
                      child:  Divider(color: buttonColor,thickness: 1.5,)),
                   Text("or Sign Up ",style: TextStyle(color: buttonColor),textAlign: TextAlign.center,),

                  SizedBox(
                      width:screenWidth * 0.3,
                      child:  Divider(color: buttonColor,thickness: 1.5,)),
                ],
              ),
            ),
            const SizedBox(height: 5,),
             Text("with",style: TextStyle(color: buttonColor,),textAlign: TextAlign.center,),
            const SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: screenWidth * 0.19,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                          side:  BorderSide(
                            color:  buttonColor, // Border color
                            width: 2.0, // Border width
                          ),
                        ), backgroundColor: const Color(0xff112220), // Button background color
                      ),
                      child:  SvgPicture.asset("assets/facebook.svg"),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: screenWidth* 0.19,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                          side:  BorderSide(
                            color:  buttonColor,
                            width: 2.0, // Border width
                          ),
                        ), backgroundColor: const Color(0xff112220), // Button background color
                      ),
                      child:  SvgPicture.asset("assets/google.svg"),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width:screenWidth * 0.19,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your button action here
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                          side:  BorderSide(
                            color: buttonColor,
                            width: 2.0, // Border width
                          ),
                        ), backgroundColor: const Color(0xff112220), // Button background color
                      ),
                      child:  SvgPicture.asset("assets/apple.svg"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Terms of use',style: TextStyle(color: buttonColor,fontSize: 16)),const SizedBox(width: 20,),Text('Privacy Policy',style: TextStyle(fontSize: 16,color: buttonColor ),),],
              ),
            )




          ],
        ),

    );
  }
}
