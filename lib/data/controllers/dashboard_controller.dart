import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as gp;
import 'package:test_task_dogbreed/data/const/dio_service.dart';
import 'package:test_task_dogbreed/data/const/strings.dart';

class DashBoardController extends gp.GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchBreedList();
  }

  Map<String, dynamic>? breedData = <String, dynamic>{}.obs;
  List<String>? breedList = <String>[].obs;

  Dio dio = DioInstance.getDio();

  void fetchBreedList() async {
    try {
      Response response =
          await dio.get(AppStrings.baseURL + AppStrings.breedList);
      if (kDebugMode) {
        print("response : ${response.data}");
      }
      breedData = response.data['message'];
      breedData?.forEach((key, value) {
        breedList?.add(key);
      });
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
    }
  }
}
