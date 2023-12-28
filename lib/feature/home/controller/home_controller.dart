import 'dart:convert';
import 'dart:developer';

import 'package:flutter_themoviedb_assignment/base/base_controller.dart';
import 'package:flutter_themoviedb_assignment/core/rest_client.dart';
import 'package:flutter_themoviedb_assignment/core/utils/configurations.dart';
import 'package:flutter_themoviedb_assignment/feature/home/models/person_result.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

import '../models/person_preview.dart';

class HomeController extends BaseController with StateMixin, ScrollMixin {
  final persons = <PersonResult>[].obs;
  var page = 1;
  var isToLoad = true;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  loadData() async {
    final map = <String, dynamic>{};
    map['page'] = page;

    try {
      final result =
          await restClient.request(Configurations.POPULAR, Method.GET, params: map);
      if (result is d.Response) {
        var data = PersonPreview.fromJson(jsonDecode(result.data)).results;
        if (data!.isNotEmpty) {
          for (PersonResult result in data) {
            // Added this condition for fetch just men of people
            if (result.gender == 2) {
              persons.add(result);
            }
          }
          isToLoad = true;
          change(persons, status: RxStatus.success());
        } else {
          isToLoad = false;
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

  @override
  Future<void> onEndScroll() async {
    if (isToLoad) {
      page++;
      await loadData();
    }
  }

  @override
  Future<void> onTopScroll() async {
    log("onTopScroll: Called");
  }
}
