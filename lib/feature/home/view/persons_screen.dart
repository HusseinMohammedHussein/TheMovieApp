import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_themoviedb_assignment/core/utils/utils.dart';
import 'package:flutter_themoviedb_assignment/feature/home/controller/home_controller.dart';
import 'package:flutter_themoviedb_assignment/feature/person_details/binding.dart';
import 'package:flutter_themoviedb_assignment/feature/person_details/view/details_screen.dart';
import 'package:get/get.dart';

class PersonsHome extends GetView<HomeController> {
  const PersonsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("popular of Person"), centerTitle: true),
      body: controller.obx((state) => GridView(
            controller: controller.scroll,
            padding: EdgeInsets.all(5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10),
            children: controller.persons.map((element) {
              return InkWell(
                onTap: () {
                  log("PersonIdClicked: ${element.id}");
                  Get.to( () => PersonDetailsScreen(), arguments: [element.id], binding: DetailsBinding());
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        blurRadius: 9.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                      )
                    ],
                  ),
                  child: Card(
                    shadowColor: Colors.black54,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160,
                          width: 200,
                          child: FadeInImage(
                            image: element.profilePath != null
                                ? NetworkImage(
                                "${Utils.IMAGE_500_BASE_URL}${element.profilePath}")
                                : const AssetImage(
                              'lib/assets/placeholderImg.png',
                            ) as ImageProvider,
                            fit: BoxFit.cover,
                            placeholder:
                            const AssetImage('lib/assets/placeholderImg.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(element.name!)
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          )),
    );
  }
}
