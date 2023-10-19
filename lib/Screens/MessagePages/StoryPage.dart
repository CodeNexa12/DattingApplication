import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

import '../Widgets/Constants.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  StoryPageState createState() => StoryPageState();
}

class StoryPageState extends State<StoryPage> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // User Profile Section

          Expanded(
            child: Stack(
              children:[ StoryView(
                storyItems: [
                  StoryItem.text(
                    title: "I guess you'd love to see more of our food. That's great.",
                    backgroundColor: Colors.blue,
                  ),

                  StoryItem.text(
                    title: "Nice!\n\nTap to continue.",
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(
                      fontFamily: 'Dancing',
                      fontSize: 40,
                    ),
                  ),
                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  print("Completed a cycle");
                  Navigator.of(context).pop();
                },
                progressPosition: ProgressPosition.top,
                repeat: false,
                controller: storyController,
              ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60,left: 20),
                    child: SizedBox(
                      child: Row(
                        children: [
                          CircleAvatar(
                            // Add your user profile image here
                            backgroundImage: AssetImage('assets/bellla.jpeg'),
                            radius: 25.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'User Name', // Replace with the actual user name
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),

                                    borderSide: BorderSide(
                                        color: Colors.white
                                    )
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(
                                      color: Colors.white

                                  ),
                                ),
                                hintText: 'Enter your message...',
                                hintStyle: TextStyle(color: Colors.white),
                                suffixIcon: IconButton(onPressed: () {
                                  print('object');
                                }, icon: SvgPicture.asset('assets/buton.svg',color: Colors.white,),)
                            ),

                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.white , // White border color
                              width: 2.0, // Border width
                            ),
                          ),
                          width: 55,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child:   Icon(
                              Icons.send_rounded,
                              size: 23,
                              color: Colors.white,

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}
