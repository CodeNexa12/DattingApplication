import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Widgets/Constants.dart';
import '../../Widgets/CustomScaffold.dart';
import 'EnableNotificationPage.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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

      SvgPicture.asset('assets/people.svg'),
      SizedBox(height: screenHeight * 0.02,),

      Text("Search friend’s",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
      SizedBox(height: 10,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text("You can find friends from your contact lists to connected",style: TextStyle(color: Colors.white70,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
                return const EnableNotificationPage();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff20A090),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child:  const Text("Access to a contact list",style: TextStyle(fontSize: 20),),
          ),
        ),
      ),
      SizedBox(height: 50,),

    ],),);
  }
}
