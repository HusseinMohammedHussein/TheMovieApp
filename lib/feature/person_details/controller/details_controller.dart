import 'dart:convert';
import 'dart:developer';


import 'package:flutter_themoviedb_assignment/base/base_controller.dart';
import 'package:flutter_themoviedb_assignment/core/rest_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class DetailsController extends BaseController with StateMixin {
  var isToLoad = true;

  void loadPersonDataDetails(int personId) async {
    try {
      var result = await restClient.request("$personId", Method.GET);
      if (result is d.Response) {
        var data = json.decode(json.encode(result.data.toString()));

        if (data != null) {
          log("PersonDetailsData: $data");
          isToLoad = false;
          change(data, status: RxStatus.success());
        } else {
          isToLoad = true;
        }
      } else {
        isToLoad = false;
      }
    } on Exception catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "$e",
        duration: const Duration(milliseconds: 3000),
      ));
    }
  }
}
