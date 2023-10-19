import 'package:datting_app_f/Screens/Widgets/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/CustomScaffold.dart';
import 'YourInterestsPage.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({super.key});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  void selectButton(int buttonNumber) {
    setState(() {
      isSelectedButton1 = buttonNumber == 1;
      isSelectedButton2 = buttonNumber == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.07,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child:  const Icon(

                      CupertinoIcons.back,
                      size: 25,

                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {  },
                  child: Text(
                    "Skip",
                    style:  TextStyle(fontSize: 20,color: buttonColor,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.05,),

          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.topLeft,
                child: Text("I am" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
          ),
          SizedBox(height: screenHeight * 0.1,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: screenWidth * 0.8,
              height: 60,
              child: ElevatedButton(
                onPressed: () => selectButton(1),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelectedButton1
                      ? buttonColor // Change color when selected
                      : Color(0xff20A090).withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: buttonColor, width: 2), // Add a white border
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Woman',style: TextStyle(color: Colors.white,fontSize: 18),),
                      Icon(CupertinoIcons.check_mark,size: 20,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: screenWidth * 0.8,
              height: 60,
              child: ElevatedButton(
                onPressed: () => selectButton(2),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelectedButton2
                      ? buttonColor // Change color when selected
                      : Color(0xff20A090).withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: buttonColor, width: 2), // Add a white border

                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Man',style: TextStyle(color: Colors.white,fontSize: 18),),
                      Icon(CupertinoIcons.check_mark,size: 20,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02,),

          Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: screenWidth * 0.8,
            height: 60,

            child: DropdownButtonFormField<String>(
              value: selectedOption,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: buttonColor, width: 2),
                ),
                filled: true,
                fillColor: Color(0xff20A090).withOpacity(0.2),
              ),
              icon: Transform.rotate(
                angle: 3, // 90 degrees in radians
                child: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                ),
              ),

              iconSize: 24,
              elevation: 16,
              dropdownColor: Color(0xff20A090), // Change the dropdown sheet color

              items: genderOptions.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        option,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),

                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: double.infinity - 150,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                    return const InterestPage();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff20A090),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child:  const Text("Continue",style: TextStyle(fontSize: 21),),
              ),
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}
