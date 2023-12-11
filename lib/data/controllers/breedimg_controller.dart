import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as gp;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:test_task_dogbreed/data/const/dio_service.dart';
import 'package:test_task_dogbreed/data/const/strings.dart';

class BreedImgController extends gp.GetxController {
  RxString imgPath = "".obs;
  RxString selectedValue = "".obs;
  RxList imgBreedList = [].obs;

  Dio dio = DioInstance.getDio();

  void fetchBreedImage(String type) async {
    try {
      String? url;
      if (type == "single") {
        url =
            AppStrings.baseURL + AppStrings.singleBreedImg(selectedValue.value);
      } else {
        url = AppStrings.baseURL +
            AppStrings.singleBreedImgList(selectedValue.value);
      }

      Response response = await dio.get(url);

      if (type == "single") {
        imgPath.value = response.data['message'];
      } else {
        imgBreedList.clear();
        imgBreedList.addAll(response.data['message']);
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
    }
  }
}
