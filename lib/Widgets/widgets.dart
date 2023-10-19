

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Constants.dart';

Widget chipList(BuildContext context) {
  return Wrap(
    alignment: WrapAlignment.center,
    runAlignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 10.0,
    runSpacing: 10.0,
    children:List.generate(
      options.length,
          (index) => Container(

        width: MediaQuery.of(context).size.width *  0.43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), // Adjust the radius for the desired roundness
          border: Border.all(
            color: buttonColor, // Change the border color
            width: 2.0, // Change the border width
          ),
        ),
        child: ChoiceChip(
          label: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: <Widget>[
                // Add an Icon before the text
                SvgPicture.asset(icons[index],color: Colors.white,),
                SizedBox(width: 8.0), // Add spacing between icon and text
                Text(options[index]),
              ],
            ),
          ),
          selected: selectedOptions.contains(options[index]),
          backgroundColor: Color(0xff112220),// Change the background color
          selectedColor: buttonColor, // Change the selected color
          labelStyle: TextStyle(
            color: Colors.white, // Change the text color
            fontWeight: FontWeight.bold, // Change text style
          ),
          onSelected: (selected) {
            toggleOption(options[index]);
            Get.forceAppUpdate();
          },
        ),
      )
      ,
    )
        .toList(),

  );

}


Widget textField(String hint , [bool? some]){
  return  Container(

    height: 60,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: buttonColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(15.0), // Adjust the value for the desired roundness
      border: Border.all(
        color: buttonColor, // Define the border color here
        width: 2.0, // Define the border width
      ),
    ),
    child:  TextField(
      keyboardType: some ==true ? TextInputType.number : TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          border: InputBorder.none, // Hide the default TextField border
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white)
      ),
    ),
  );
}
