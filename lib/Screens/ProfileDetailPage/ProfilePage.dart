import 'package:datting_app_f/Screens/Widgets/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MessagePages/MessageHomePage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gigi.jpg' ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            
            padding: const EdgeInsets.only(top: 50,left: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.white, // White border color
                    width: 2.0, // Border width
                  ),
                ),
                width: 50,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white30,
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
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5, // Initial size when collapsed
            minChildSize: 0.1, // Minimum size when fully expanded
            maxChildSize: 0.8, // Maximum size when fully expanded
            builder: (context, controller) => Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff0E0D0D), Color(0xff112220)],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(1.0, 2.0))
                  ]),
              child: ListView.builder(
                controller: controller,
                itemCount: 1, // Example itemCount
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        children: <Widget>[
                          Transform.translate(
                            offset: const Offset(0, -20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.width * 0.18,
                                  width: MediaQuery.of(context).size.width * 0.18,
                                  child: ElevatedButton(
                                    onPressed: () async {

                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('Profile Disliked'),
                                      ));

                                    },
                                    style: ElevatedButton.styleFrom(

                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(15),
                                      elevation: 10.0,
                                      backgroundColor:  Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: buttonColor,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width * 0.18,
                                  width: MediaQuery.of(context).size.width * 0.18,
                                  child: ElevatedButton(
                                    onPressed: () async {

                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('Profile Liked'),
                                      ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: buttonColor,
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(15),
                                      elevation: 10.0,
                                    ),
                                    child: const Icon(
                                      CupertinoIcons.heart_fill,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20,),

                                SizedBox(
                                  height: MediaQuery.of(context).size.width * 0.18,
                                  width: MediaQuery.of(context).size.width * 0.18,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text('Profile Disliked'),
                                      ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding: const EdgeInsets.all(15),
                                      elevation: 10.0,
                                      backgroundColor:  Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.star,
                                      color: buttonColor,
                                      size: 35,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.only(right: 20),
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "lisa Monroe , 23",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      color: Colors.white),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),

                                    ),
                                    width: 50,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                                          return MessageHomePage();
                                        }));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: buttonColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                      ),
                                      child:  const Icon(
                                        Icons.send_rounded,


                                        size: 25,

                                      ),
                                    ),
                                  ),
                                ),

                              ],
                          ),
                           ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Gamer",

                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                ('Location'),

                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                              Container(
                                width: 80, // Adjust the width as needed
                                height: 35, // Adjust the height as needed
                                decoration:  BoxDecoration(

                                  color: buttonColor.withOpacity(0.4),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      children: [
                                        Icon(CupertinoIcons.location_solid,color: Colors.white,size: 15,),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '1 km',
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Lahore",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'About',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "i'm Adams Royale,a Profht and Cardio are my favorities.Started my Fitness journey about 6 years ago.",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Read more',
                              style: TextStyle(color: buttonColor),
                            ),
                          ),


                          const SizedBox(
                            height: 30,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Interests',
                              style: TextStyle(
                                fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 100,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 50 /25,
                                crossAxisCount: 3, // Number of columns in the grid
                                crossAxisSpacing: 10, // Horizontal spacing between items
                                mainAxisSpacing: 10, // Vertical spacing between items
                              ),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration:  BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 1.0

                                    ),

                                    color: Colors.white12,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "Some",
                                      style: TextStyle(color: Colors.white, fontSize: 13,fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gallery',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  0,
                                  10,
                                  0,
                                ),
                                child: Text(
                                  'See all',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(223,64,87,1)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,

                              itemBuilder: (BuildContext context, int index) {
                                return  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: AssetImage('assets/bellla.jpeg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}





