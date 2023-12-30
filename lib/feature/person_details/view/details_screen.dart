import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_themoviedb_assignment/core/utils/utils.dart';
import 'package:flutter_themoviedb_assignment/feature/person_details/controller/details_controller.dart';
import 'package:flutter_themoviedb_assignment/feature/person_details/controller/profile_controller.dart';
import 'package:flutter_themoviedb_assignment/feature/person_details/models/details.dart';
import 'package:flutter_themoviedb_assignment/feature/person_image_details/view/image_view_screen.dart';
import 'package:flutter_themoviedb_assignment/feature/person_image_details/view/image_view_screen.dart';
import 'package:get/get.dart';

class PersonDetailsScreen extends GetView<DetailsController> {
  PersonDetailsScreen({super.key});

  final profileControl = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var getPersonId = Get.arguments;

    controller.loadPersonDataDetails(getPersonId[0]);
    profileControl.getPersonDetailsImage(getPersonId[0]);

    return controller.obx((state) => controller.isToLoad
        ? _isLoading()
        : getPersonDetails(context, PersonDetails.fromJson(jsonDecode(state))));
  }

  getPersonDetails(BuildContext context, PersonDetails details) {
    log("ProfileImagesResponse: ${profileControl.personsDetails.length}");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Person Details"), centerTitle: true),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                child: SizedBox(
                  height: 300,
                  width: 250,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: FadeInImage(
                      image: details.profilePath != null
                          ? NetworkImage(
                              "${Utils.IMAGE_ORIGINAL_BASE_URL}${details.profilePath}")
                          : const AssetImage(
                              'lib/assets/placeholderImg.png',
                            ) as ImageProvider,
                      fit: BoxFit.cover,
                      placeholder:
                          const AssetImage('lib/assets/placeholderImg.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${details.name}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Biography",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("${details.bioGraphy}",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 15)),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Known For",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: profileControl.obx((state) => ListView.builder(
                        // physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: profileControl.personsDetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => ImageViewScreen(
                                  imagePath: state[index].filePath));
                            },
                            child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: FadeInImage(
                                  height: 150,
                                  width: 150,
                                  image: state[index].filePath != null
                                      ? NetworkImage(
                                          "${Utils.IMAGE_500_BASE_URL}${state[index].filePath}")
                                      : const AssetImage(
                                          'lib/assets/placeholderImg.png',
                                        ) as ImageProvider,
                                  fit: BoxFit.cover,
                                  placeholder: const AssetImage(
                                      'lib/assets/placeholderImg.png'),
                                )),
                          );
                        })),
                  )
                ],
              )
            ]),
          ),
        ));
  }

  Widget _isLoading() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("data")),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
