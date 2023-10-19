import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import '../Widgets/Constants.dart';
import '../Widgets/CustomScaffold.dart';
import 'ProfileDetails/profileDetails.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});
  @override
  State<CodePage> createState() => _CodePageState();
}
class _CodePageState extends State<CodePage> {
  int _seconds = 60;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1) {
          FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
        }
      });
    }
    _startTimer();
  }
  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (_seconds == 0) {
          // Reset the timer to 00:00 when it reaches 59 seconds
          _seconds = 0;
        } else {
          _seconds--;
        }
      });
    });
  }
  @override
  void dispose() {
    // Dispose of the timer when the page is disposed
    _timer.cancel();
    super.dispose();
  }
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    String formattedTime = _formatTime(_seconds);
    return CustomScaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
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
            ),
          ),
          const SizedBox(height: 35,),
          Text(
            formattedTime,
            style: const TextStyle(fontSize: 25,color: Colors.white),
          ),
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text("Type the verification code we’ve sent you",style: TextStyle(
              fontSize: 20,
              color: Colors.white54,
            ),textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 65,
                  height: 80,
                  child: TextField(

                    style: const TextStyle(color: Colors.white,fontSize: 25),
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    maxLength: 1,
                    keyboardType: TextInputType.none,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),

                        borderSide: BorderSide(color: buttonColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(color: Colors.white,),
                      ),
                      counterText: '',
                    ),
                  ),
                ),
              );
            }),
          ),
          const Spacer(),
          PinKeyboard(
            maxWidth: double.infinity,
            iconBackspaceColor:Colors.white70,
            textColor: Colors.white70,
            length: 4,
            enableBiometric: false,
            iconBiometricColor: Colors.blue[400],
            onChange: (pin) {
              // Update the text fields with the entered PIN
              for (int i = 0; i < 4; i++) {
                if (i < pin.length) {
                  _controllers[i].text = pin[i];
                } else {
                  _controllers[i].clear();
                }
              }
              print(_controllers[0].text+_controllers[1].text+_controllers[2].text+_controllers[3].text);
              if((_controllers[0].text+_controllers[1].text+_controllers[2].text+_controllers[3].text).length == 4){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return const ProfileDetails();
                }));
              }
            },


            onBackButton: () {
              for (int i = 0; i < _controllers.length; i++) {
                _controllers[i].clear();
              }
            },

            onConfirm: (pin) {


    },
      onBiometric: () {},



          ),

          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: TextButton(onPressed: (){}, child: Text("Send Again",style: TextStyle(color: buttonColor,fontSize: 18),)),
          )

        ],
      ),
    );
  }
  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }
}
