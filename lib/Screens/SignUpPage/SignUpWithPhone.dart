import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../Widgets/Constants.dart';
import '../Widgets/CustomScaffold.dart';
import 'CodePage.dart';

class SignUpPhone extends StatefulWidget {
  const SignUpPhone({super.key});

  @override
  State<SignUpPhone> createState() => _SignUpPhoneState();
}

class _SignUpPhoneState extends State<SignUpPhone> {
  CountryCode? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Column(

        children: [
          SizedBox(height: screenHeight * 0.2,),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Mobile",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.w700)),
                SizedBox(height: 10,),
                Text("Please enter your valid phone number. We will send you a 4-digit code to verify your account. ",
                    style: TextStyle(color: Colors.white70,fontSize: 18),textAlign: TextAlign.start,),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02,),
          Container(
            width: screenWidth * 0.8,
            height: 60, // Set the height as needed
            decoration: BoxDecoration(
              color: const Color(0xff112220),
              borderRadius: BorderRadius.circular(20.0), // Border radius to make it rounded
              border: Border.all(
                color: buttonColor,
                width: 2.0, // Border width
              ),
            ),
            child: Row(
              children: [
                CountryCodePicker(
                  onChanged: (countryCode) {
                    setState(() {
                      _selectedCountry = countryCode;
                    });
                  },
                  initialSelection: 'US', // Initial country code selection
                  textStyle: const TextStyle(color: Colors.white), // Set text color to white
                  showCountryOnly: false, // Show country name in the picker popup
                  dialogBackgroundColor: const Color(0xff112220),
                  barrierColor:const Color(0xff0E0D0D), // Background color of the barrier behind the picker popup
                  searchDecoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white), // Set search hint text color to white
                  ),
                  dialogTextStyle: const TextStyle(color: Colors.white), // Set dialog text color to white
                  searchStyle: const TextStyle(color: Colors.white),
                ),
                  Container(
                    color: Colors.white,
                    height: 30,
                    width: 1.5,
                  ),
                const SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(

                       border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white, // Set the text color
                      // You can also set other text style properties as needed
                    ),
                  ),
                )


              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.08),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return const CodePage();
                  }));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
