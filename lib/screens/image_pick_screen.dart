import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickScreen extends StatefulWidget {
  const ImagePickScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickScreen> createState() => _ImagePickScreenState();
}

class _ImagePickScreenState extends State<ImagePickScreen> {
  List<XFile> file = [];


  final imagePick = ImagePicker();

  XFile? image;

  final Map<int, Widget> data = <int, Widget>{
    0: Icon(
      CupertinoIcons.home,
      size: 22,
    ),
    1: Icon(CupertinoIcons.cart),
  };

  int? select;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSlidingSegmentedControl(
                    padding: EdgeInsets.all(10),
                    children: data,
                    groupValue: select,
                    thumbColor: Colors.black,
                    onValueChanged: (int? val) {
                      select = val;
                      setState(() {});
                    }),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final imagePath =
                        await imagePick.pickImage(source: ImageSource.camera);

                    file.add(imagePath!);

                    setState(() {});
                  },
                  child: Text('GAl')),
              ElevatedButton(
                  onPressed: () async {
                    final imagePath = await imagePick.pickMultiImage(
                        imageQuality: 5, requestFullMetadata: true);
                    imagePath.forEach((element) {
                      file.add(element);
                      setState(() {});
                    });
                    setState(() {});
                  },
                  child: Text('Select Camera')),
              SizedBox(height: 10),
              Wrap(
                children: [
                  for (var i in file)
                    i.path.isEmpty
                        ? Text("No Data Found")
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                  height: 230,
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(File(i.path)),
                                        fit: BoxFit.cover),
                                  )),
                            ),
                          )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
