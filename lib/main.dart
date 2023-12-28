import 'package:flutter/material.dart';
import 'package:flutter_themoviedb_assignment/feature/home/binding.dart';
import 'package:flutter_themoviedb_assignment/feature/home/view/persons_screen.dart';
import 'package:get/get.dart';

import 'core/rest_client.dart';
import 'feature/person_details/view/details_screen.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

initServices() async {
  await Get.putAsync<RestClient>(() => RestClient().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "The Movies App",
      initialRoute: "/home",
      getPages: [
        GetPage(
            name: "/home", page: () => const PersonsHome(), binding: HomeBinding()),
      ],
      routes: {
        "/home" : (context) => const PersonsHome(),
        "/details" : (context) => PersonDetailsScreen(),
      },
    );
  }
}
