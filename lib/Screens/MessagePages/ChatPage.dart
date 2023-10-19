import 'package:datting_app_f/Screens/Widgets/Constants.dart';
import 'package:datting_app_f/Screens/Widgets/CustomScaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios,color: buttonColor,),),
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xff1E2B29),
        title: const Row(
          children: [
            SizedBox(
              height: 65,
              width: 65,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/face.jpg',), // Add your profile image here
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'John Doe', // Add the name here
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  'Online', // Add the name here
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert,size: 30),
            onPressed: () {
              // Add action for more options
            },
          ),
        ],
      ),
      body: CustomScaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Replace with your message list length
                itemBuilder: (context, index) {
                  // Replace with your message item widget
                  return MessageItem(
                    message: 'Haha truly! Nice to meet you Grace! What about a cup of coffee today evening? ☕️ ',
                    isMyMessage: index % 2 == 0,
                    timestamp: '10:30 AM', // Replace with the actual timestamp
                  );
                },
              ),
            ),
            Padding(
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
                                color: buttonColor
                            )
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                              color: buttonColor

                          ),
                        ),
                        hintText: 'Enter your message...',
                        hintStyle: TextStyle(color: buttonColor),
                        suffixIcon: IconButton(onPressed: () {
                          print('object');
                        }, icon: SvgPicture.asset('assets/buton.svg',),)
                      ),
                      
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: buttonColor, // White border color
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


                        Icons.keyboard_voice,
                        size: 23,
                        color: buttonColor,

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String message;
  final bool isMyMessage;
  final String timestamp;

  MessageItem({super.key,
    required this.message,
    required this.isMyMessage,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
        isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(

            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isMyMessage ? buttonColor : Colors.white,
              borderRadius:isMyMessage ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(0),
              ) : const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 1.5,
              ),
              child: Text(
                message,
                style:  TextStyle( color: isMyMessage ? Colors.white : Colors.black,),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            timestamp,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
