import 'dart:io';
import 'package:datting_app_f/Screens/Widgets/Constants.dart';
import 'package:datting_app_f/Screens/Widgets/CustomScaffold.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'ProfileDesciption.dart';

class PhotosAddScreen extends StatefulWidget {
  PhotosAddScreen({Key? key,}) : super(key: key);

  @override
  State<PhotosAddScreen> createState() => _PhotosAddScreenState();
}

class _PhotosAddScreenState extends State<PhotosAddScreen> {
  final ImagePicker picker = ImagePicker();
  final List<File> selectedPhotos = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.07,),
              Row(
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
                  SizedBox()
                ],
              ),
              SizedBox(height: screenHeight * 0.05,),


              const Text("Add Photos", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 21)),
              const SizedBox(height: 20),
              const Text("You can include multiple images, with a maximum of six images",
                  style: TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              Container(
                height: Get.height * 0.5,
                child: GridView.builder(
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemCount: selectedPhotos.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < selectedPhotos.length) {
                      return _gridComponentConFoto(selectedPhotos[index]);
                    } else if (index == selectedPhotos.length) {
                      return selectedPhotos.length == 6 ? const SizedBox()  : _gridComponentSinFoto();
                    }
                    return Container();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                        //   return const SearchPage();
                        // }));
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          return  AddProfileDescription();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff20A090),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child:  const Text("Continue",style: TextStyle(fontSize: 21),),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ],
          ),
        ),

    );
  }

  Future<void> _selectImage() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final File? compressedImage = await File(image.path);
        selectedPhotos.add(compressedImage!);
        Get.forceAppUpdate();
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Algo ha ido mal al seleccionar la imagen',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    }
  }



  Widget _gridComponentConFoto(File url) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: Image.file(
              url,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: IconButton(
              onPressed: () {
                selectedPhotos.remove(url);
                Get.forceAppUpdate();
              },
              icon: Icon(
                Icons.close,
                color: Get.theme.primaryColorDark,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _gridComponentSinFoto() {
    return GestureDetector(
      onTap: () {
        _selectImage();
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(15),
        dashPattern: [5, 5],
        color: buttonColor,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: Container(
            color: buttonColor.withOpacity(0.2),
            child: Center(
              child: Icon(
                Icons.add,
                color: Get.theme.primaryColorDark,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> uploadImagesToFirebaseStorage(List<File> images) async {
  //   try {
  //     final storage = FirebaseStorage.instance;
  //     List<String > imagesUrl  = [];
  //
  //     for (int i = 0; i < images.length; i++) {
  //       final image = images[i];
  //       final fileName = '${widget.id}_image_$i.jpg';
  //       final Reference storageRef = storage.ref().child(fileName);
  //       await storageRef.putFile(image);
  //
  //       // Get the download URL for the uploaded image
  //       String imageUrl = await storageRef.getDownloadURL();
  //       imagesUrl.add(imageUrl);
  //       // Now you can use 'imageUrl' for further processing, like storing it in Firestore.
  //       print('Download URL for $fileName: $imagesUrl');
  //     }
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(user?.uid)
  //         .update({
  //       'photos': imagesUrl,
  //     });
  //   } catch (e) {
  //     print('Error uploading images to Firebase Storage: $e');
  //   }
  // }

}
