import 'package:flutter_themoviedb_assignment/core/rest_client.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  late RestClient restClient;

  @override
  onInit() {
    super.onInit();
    restClient = Get.find();
  }


}
