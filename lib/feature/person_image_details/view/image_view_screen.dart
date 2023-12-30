import 'dart:developer';
import 'dart:io';
import 'dart:core';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter_themoviedb_assignment/core/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ImageViewScreen extends StatefulWidget {
  String? imagePath;

  ImageViewScreen({super.key, this.imagePath});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  late Size size;
  var response;

  @override
  void initState() {
    super.initState();
    getNetworkImage();
  }

  Future<http.Response> getNetworkImage() async {
    response = await http
        .get(Uri.parse(Utils.IMAGE_ORIGINAL_BASE_URL + widget.imagePath!));
    return response;
  }

  saveImage() async {
    Directory? externalStorage = await getExternalStorageDirectory();
    log("External Storage: $externalStorage");
    File file = File(
        path.join(externalStorage!.path, path.basename(widget.imagePath!)));
    await file.writeAsBytes(response.bodyBytes);
    directoryFile(file);
    log("File: $file");
  }

  directoryFile(file) async {
    showDialog(
        context: context,
        builder: (c) => AlertDialog(
              title: const Text("Image Saved Success", textAlign: TextAlign.center),
              content: SizedBox(
                height: size.height * 0.8,
                child: Column(
                  children: [
                    Image.file(file),
                    ElevatedButton.icon(
                        onPressed: () async {
                          Get.toNamed("/home");
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white)),
                        ),
                        label: Text('Continue'))
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Image View")),
      body: Center(
        child: Container(
          height: size.height * 0.5,
          padding: const EdgeInsets.all(15),
          child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: 260,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: FadeInImage(
                        image: widget.imagePath != null
                            ? NetworkImage(
                                "${Utils.IMAGE_ORIGINAL_BASE_URL}${widget.imagePath}")
                            : const AssetImage(
                                'lib/assets/placeholderImg.png',
                              ) as ImageProvider,
                        fit: BoxFit.cover,
                        placeholder:
                            const AssetImage('lib/assets/placeholderImg.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                      onPressed: () async {
                        saveImage();
                      },
                      icon: const Icon(
                        Icons.file_download,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(color: Colors.white)),
                      ),
                      label: Text('Dowload Invoice'))
                ],
              )),
        ),
      ),
    );
  }
}