import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../LoginPage/LoginPage.dart';
import '../SignUpPage/SignUpPage.dart';
import '../Widgets/Constants.dart';
import '../Widgets/CustomScaffold.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, Key? keys});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.1),
                CarouselSlider(
                  items: items,
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.1,
                    viewportFraction: 0.6,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                texts[currentIndex],
                SizedBox(height: constraints.maxHeight * 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: desc[currentIndex],
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < items.length; i++)
                      Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == i ? Colors.white : Colors.grey,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * 0.08),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const SignUpPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: const Text(
                        "Create an Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const LoginScreen();
                        }));
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Already have an account?  ',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
