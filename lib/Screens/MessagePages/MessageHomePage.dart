import 'package:datting_app_f/Screens/MessagePages/ChatPage.dart';
import 'package:datting_app_f/Screens/Widgets/CustomScaffold.dart';
import 'package:flutter/material.dart';

import 'StoryPage.dart';


class MessageHomePage extends StatefulWidget {
  const MessageHomePage({super.key, Key? keys});
  @override
  State<MessageHomePage> createState() => _MessageHomePageState();
}
class _MessageHomePageState extends State<MessageHomePage> {


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 38, 0, 0),
                    child: Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),

                        borderSide: BorderSide(
                        color: Colors.white
                      )
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Activities',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                            return StoryPage();
                          }));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage('assets/bellla.jpeg'), // Load the image from the URL
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Anna',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );

                                  },
                )
              )
            ],
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 00, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Messages',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                  child: InkWell(
                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return ChatPage();
                      }));
                    },
                    child: Center(
                      child: Column(
                        children: [
                          ListTile(
                            trailing: const Text('23 min',style: TextStyle(color: Colors.white,fontSize: 13),),
                            leading:  ClipRRect(
                              borderRadius: BorderRadius.circular(100), // Adjust the radius as needed
                              child: Image.asset(
                                'assets/face.jpg',
                                width: 65, // Adjust the width as needed
                                height: 65, // Adjust the height as needed
                                fit: BoxFit.cover, // Adjust the fit mode as needed
                              ),
                            ),
                            title: const Text("Faizan",style: TextStyle(color: Colors.white,fontSize: 20)),
                            subtitle : const Text(
                              "Some!",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 80),
                            child: Divider(thickness: 0.3,color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
