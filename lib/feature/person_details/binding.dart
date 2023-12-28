import 'package:flutter_themoviedb_assignment/feature/person_details/controller/details_controller.dart';
import 'package:flutter_themoviedb_assignment/feature/person_details/controller/profile_controller.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}