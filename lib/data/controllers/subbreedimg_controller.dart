import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as gp;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:test_task_dogbreed/data/const/dio_service.dart';

import '../const/strings.dart';
import 'dashboard_controller.dart';

class SubBreedImgController extends gp.GetxController {
  RxString imgPath = "".obs;
  RxString mainDropDownSelectedValue = "".obs;
  RxString subDropDownSelectedValue = "".obs;
  RxList imgSubBreedList = [].obs;
  RxList subBreedDropDownList = [].obs;

  Dio dio = DioInstance.getDio();

  void fetchSubBreedImage(String type, DashBoardController controller,String callFrom) async {
    try {

      if(callFrom != "subCategory"){
        final subBreedData = controller.breedData?[mainDropDownSelectedValue.value];
        if (subBreedData != null) {
          subBreedDropDownList.addAll(subBreedData);
          if(subBreedDropDownList.isNotEmpty) subDropDownSelectedValue.value = subBreedDropDownList[0];
        }
      }

      String? url;
      if (type == "single") {
        if (subBreedDropDownList.isNotEmpty) {
          url = AppStrings.baseURL +
              AppStrings.singleSubBreedImg(mainDropDownSelectedValue.value,
                  subDropDownSelectedValue.value);
        } else {
          url = AppStrings.baseURL +
              AppStrings.singleBreedImg(mainDropDownSelectedValue.value);
        }
      } else {
        if (subBreedDropDownList.isNotEmpty) {
          url = AppStrings.baseURL +
              AppStrings.singleSubBreedImgList(mainDropDownSelectedValue.value,
                  subDropDownSelectedValue.value);
        } else {
          url = AppStrings.baseURL +
              AppStrings.singleBreedImgList(mainDropDownSelectedValue.value);
        }
      }

      Response response = await dio.get(url);

      if (type == "single") {
        imgPath.value = response.data['message'];
      } else {
        imgSubBreedList.clear();
        imgSubBreedList.addAll(response.data['message']);
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
    }
  }
}
