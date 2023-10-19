import 'package:flutter/material.dart';
import '../../../../Widgets/Constants.dart';
import '../../../../Widgets/CustomScaffold.dart';
import 'SearchFriendPage.dart';

class AddProfileDescription extends StatefulWidget {
  const AddProfileDescription({super.key});
  @override
  State<AddProfileDescription> createState() => _AddProfileDescriptionState();
}

class _AddProfileDescriptionState extends State<AddProfileDescription> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Edit Profile Description",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: screenHeight * 0.1,),
            const Align(
              alignment: Alignment.topLeft,
                child: Text("Profile Description",style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,)),
            const SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: buttonColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.0), // Adjust the value for the desired roundness
                border: Border.all(
                  color: buttonColor, // Define the border color here
                  width: 2.0, // Define the border width
                ),
              ),
              child:  const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none, // Hide the default TextField border
                    hintText: "Your Profile Description",
                    hintStyle: TextStyle(color: Colors.white)
                ),
              ),
            ),
            const SizedBox(height: 35,),

            const Align(
                alignment: Alignment.topLeft,
                child: Text("Profession",style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,)),
            const SizedBox(height: 10,),
            Container(
              height: 50,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: buttonColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.0), // Adjust the value for the desired roundness
                border: Border.all(
                  color: buttonColor, // Define the border color here
                  width: 2.0, // Define the border width
                ),
              ),
              child:  const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none, // Hide the default TextField border
                    hintText: "Add Profession",
                    hintStyle: TextStyle(color: Colors.white)
                ),
              ),
            ),
            const SizedBox(height: 45,),

            SizedBox(
              width: screenWidth * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return const SearchPage();
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
          ],
        ),
      ),

    );
  }
}
