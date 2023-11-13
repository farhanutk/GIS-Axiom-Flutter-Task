import 'dart:convert';

import 'package:get/get.dart';
import 'package:gis_axiom_flutter_task/features/home/model/home_data_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  bool isLoading = false;
  HomeDataModel homeDataModel = HomeDataModel();
  Uri url = Uri.parse('https://kezel.co/api/getAllDigitalMenu.php');

  getHomeData() async {
    isLoading = true;
    update();

    final response =
        await http.post(url, body: {"restaurant": "LeisureInnVKL"});

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      homeDataModel = HomeDataModel.fromJson(jsonResponse);

      isLoading = false;
      update();
    } else {
      Get.snackbar('Oops!', 'Something went wrong.');
      isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}
