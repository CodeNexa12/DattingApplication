import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../Widgets/Constants.dart';
import '../../../../Widgets/CustomScaffold.dart';
import '../../../../Widgets/widgets.dart';
import 'AddPhotosPage.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {




  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(body: Column(
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
        const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your interests" ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30)),
                  const SizedBox(height: 10,),

                  Text("Select a few of your interests and let everyone know what you’re passionate about." ,style: TextStyle(color: Colors.white60,fontWeight: FontWeight.bold,fontSize: 15)),
                ],
              )),
        ),

        SizedBox(height: 20),
        Center(child: chipList(context)),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SizedBox(
            width: double.infinity - 150,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                //   return const SearchPage();
                // }));
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return  PhotosAddScreen();
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
        SizedBox(height: 20,),

      ],
    ));
  }

}
