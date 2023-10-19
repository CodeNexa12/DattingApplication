import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Widgets/CustomScaffold.dart';
import '../../../../Widgets/CustomeDatePicker.dart';
import 'SelectGenderPage.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  File? _image; // Store the selected image

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Opens gallery for image selection

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the selected image
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          SizedBox(height: screenHeight * 0.07,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: (){},child: const Text("Skip",style: TextStyle(color: Color(0xffF55C1B),fontWeight: FontWeight.bold,fontSize: 20)),),
            ),
          ),
          SizedBox(height: screenHeight * 0.05,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextButton(onPressed: (){},child: const Text("Profile Details",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 35)),),
            ),
          ),
          SizedBox(height: screenHeight * 0.05,),
          Container(
            height: 110,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Make the container round
              image: DecorationImage(
                image: _image != null
                    ? FileImage(_image!) as ImageProvider<Object> // Explicit cast to ImageProvider<Object>
                    : const AssetImage("assets/face.jpg"), // Default image
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: Offset(10, 10),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffF55C1B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white, width: 2), // Add a white border
                      ),
                    ),
                    child: Center(
                      child: Transform.translate(offset: Offset(-4, 0),
                      child: Icon(Icons.camera_alt, color: Colors.white)), // Icon with white color
                    ),
                  ),

            ),
              ),
            ),
          ),



          SizedBox(height: screenHeight * 0.05,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white), // Customize hint text color

                hintText: "David",
                labelText: 'First Name', // Add your label text here
                labelStyle: const TextStyle(color: Colors.white), // Customize label text color
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Customize border radius
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0), // White border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Customize border radius
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0), // White border color
                ),
              ),
              style: const TextStyle(color: Colors.white), // Customize text color
              // Other TextField properties (controller, onChanged, etc.)
            ),
          ),
          SizedBox(height: screenHeight * 0.03,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),

            child: TextField(
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white), // Customize hint text color
                hintText: "Potter",
                labelText: 'Last name', // Add your label text here
                labelStyle: const TextStyle(color: Colors.white), // Customize label text color
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Customize border radius
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0), // White border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // Customize border radius
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0), // White border color
                ),
              ),
              style: const TextStyle(color: Colors.white), // Customize text color
              // Other TextField properties (controller, onChanged, etc.)
            ),
          ),
        SizedBox(height: screenHeight * 0.03,),



        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            width: double.infinity - 150,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff20A090).withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SvgPicture.asset("assets/Calendar.svg"),
                  const SizedBox(width: 10,),

                  const Text("Choose birthday date",style: TextStyle(color: Color(0xff20A090),fontSize: 16),),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.03,),



        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            width: double.infinity - 150,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return SelectGender();
                }));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff20A090),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child:  const Text("Confirm",style: TextStyle(fontSize: 21),),
            ),
          ),
        ),







      ],
    ),
        ));
  }
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showCustomDatePicker(
      helpText: "Asd",
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  Future<void> _showCustomDatePicker(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              Container(
                height: 50,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Text(
                  'Select a Date',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: selectedDate,
                    onDateTimeChanged: (date) {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Do something with the selected date
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}


DateTime selectedDate = DateTime.now();

