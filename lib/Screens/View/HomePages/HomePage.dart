import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/CustomScaffold.dart';
import '../ProfileDetailPage/ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/gigi.jpg',
    'assets/bellla.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(

        children:[

          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
              childAspectRatio:
                  80 / 200, // Adjust this value to set the aspect ratio
            ),
            itemCount: 20, // Number of items in the grid
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        return ProfilePage();
                      }));
                },
                child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            images[index % 2],
                          ),
                          fit: BoxFit.cover),
                      color: Colors.blueAccent,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                      // Adjust the opacity and color here
                      child: Column(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        // Set the border radius here

                                        image: DecorationImage(
                                            image: AssetImage(
                                              images[index % 2],
                                            ),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Container(
                                          decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(10.0),
                                      )),
                                    ),
                                    const Text(
                                      "Lesli \nFox 21",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.location_solid,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        Text(
                                          "Phoenix ,USA",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 8,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [

                                    Container(
                                      height: 23,
                                      width: 23,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.black26,

                                      ),
                                      child: const Icon(CupertinoIcons.heart,size: 15,),
                                    ),
                                    const SizedBox(height: 10,),
                                    Container(
                                      height: 23,
                                      width: 23,

                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.black26,


                                      ),
                                      child: const Icon(Icons.chat_outlined,size: 15,),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Align(
                alignment: Alignment.topCenter,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white30,
                ),
                height: 45,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white30,
                      ),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.35 / 2,
                        child:                     const Center(child: Text("For You",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))

                    ),
                      const Text("Near by",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                  ),
                ),
              ),
            ),
          ),

    ]
      ),
    );
  }
}
