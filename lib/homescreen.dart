import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool imageAvailable = false;
  late Uint8List imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              color: Colors.blue,
              child: imageAvailable ? Image.memory(imageFile) : const SizedBox(),
            ),
            GestureDetector(
              onTap: () async {
                final image = await ImagePickerWeb.getImageAsBytes();

                setState(() {
                  imageFile = image!;
                  imageAvailable = true;
                });
              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.orange,
                child: Center(
                  child: Text("Pick Image"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
