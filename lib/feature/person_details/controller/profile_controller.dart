import 'dart:convert';

import 'package:flutter_themoviedb_assignment/base/base_controller.dart';
import 'package:flutter_themoviedb_assignment/core/rest_client.dart';
import 'package:flutter_themoviedb_assignment/feature/person_details/models/person_profile.dart';
import 'package:flutter_themoviedb_assignment/feature/person_details/models/profile_details.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class ProfileController extends BaseController with StateMixin {
  final personsDetails = <ProfileDetails>[].obs;
  var isToLoad = true;

  getPersonDetailsImage(int personId) async {
    try {
      var result = await restClient.request("$personId/images", Method.GET);
      if (result is d.Response) {
        var data = PersonProfile.fromJson(jsonDecode(result.data)).profiles;
        if (data!.isNotEmpty) {
          personsDetails.clear();
          for (ProfileDetails item in data) {
            personsDetails.add(item);
          }
        }
        change(personsDetails, status: RxStatus.success());
      }
    } on Exception catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "$e",
        duration: const Duration(milliseconds: 3000),
      ));
    }
  }
}
