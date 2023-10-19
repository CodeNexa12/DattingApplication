import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Color buttonColor = const Color(0xff20A090);

String logo = "assets/logo.svg";

final List<String> options = [
  'Photography',
  'Shopping',
  'Koraoke',
  'Yoga',
  'Cooking',
  'Tennis',
  'Run',
  'Swimming',
  'Art',
  'Traveling',
  'Extreme',
  'Music',
  'Drink',
  'Video games'
];

final List<String> icons = [
  'assets/options/camera.svg',
  'assets/options/Vector (Stroke).svg',
  'assets/options/voice.svg',
  'assets/options/viencharts.svg',
  'assets/options/noodles.svg',
  'assets/options/tennis.svg',
  'assets/options/sport.svg',
  'assets/options/ripple.svg',
  'assets/options/platte.svg',
  'assets/options/outdoor.svg',
  'assets/options/parachute.svg',
  'assets/options/music.svg',
  'assets/options/goblet-full.svg',
  'assets/options/game-handle.svg',
];

List<String> selectedOptions = [];
    List<Widget> items = [
  ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset('assets/third.jpg')),
  ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset('assets/second.jpg')),
  ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset('assets/first.jpg')),
];

List<Widget> texts = [
  const Text(
    "Algorithm",
    style: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  const Text(
    "Matches",
    style: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
  const Text(
    "Premium",
    style: TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  ),
];

List<Widget> desc = [
  const Text(
    "Users going through a vetting process to ensure you never match with bots.",
    style: TextStyle(color: Colors.white, fontSize: 14),
    textAlign: TextAlign.center,
  ),
  const Text(
    "We match you with people that have a large array of similar interests.",
    style: TextStyle(color: Colors.white, fontSize: 14),
    textAlign: TextAlign.center,
  ),
  const Text(
    "Sign up today and enjoy the first month of premium benefits on us.",
    style: TextStyle(color: Colors.white, fontSize: 14),
    textAlign: TextAlign.center,
  ),
];

void toggleOption(String option) {
  print(selectedOptions);
  if (selectedOptions.contains(option)) {
    selectedOptions.remove(option);
  } else {
    selectedOptions.add(option);
  }
}

bool isSelectedButton1 = false;
bool isSelectedButton2 = false;

String selectedOption = 'Other'; // Default selected option

List<String> genderOptions = [
  'Other',
  'Cisgender',
  'Genderfluid',
  'Genderqueer',
  'Intersex',
  'Gender nonconforming',
  'Transgender'
];
