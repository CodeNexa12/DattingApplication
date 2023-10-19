import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Widgets/Constants.dart';
import '../../../../Widgets/CustomScaffold.dart';
import '../../HomePages/HomePage.dart';



class EnableNotificationPage extends StatelessWidget {
  const EnableNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(body: Column(children: [
      SizedBox(height: screenHeight * 0.07,),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 50,
              height: 50,
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
      SizedBox(height: screenHeight * 0.02,),

      SvgPicture.asset('assets/chat.svg'),
      SizedBox(height: screenHeight * 0.02,),

      Text("Enable notification’s",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
      SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text("Get push-notification when you get the match or receive a message.",style: TextStyle(color: Colors.white70,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
                return  HomePage();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff20A090),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child:  const Text("I want to be notified",style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
      SizedBox(height: 50,),

    ],),);
  }
}
