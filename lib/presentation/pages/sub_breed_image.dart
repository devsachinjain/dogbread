import 'package:flutter/material.dart';
import 'package:test_task_dogbreed/data/const/strings.dart';
import 'package:get/get.dart';
import 'package:test_task_dogbreed/data/controllers/dashboard_controller.dart';
import 'package:test_task_dogbreed/presentation/widgets/appbar.dart';
import 'package:test_task_dogbreed/presentation/widgets/displayMsg.dart';
import 'package:test_task_dogbreed/presentation/widgets/dropdowndecoration.dart';
import '../../data/controllers/subbreedimg_controller.dart';

class ImageBySubBread extends StatelessWidget {
  ImageBySubBread({super.key});

  final dashBoardController = Get.find<DashBoardController>();
  final subBreedImgController = Get.find<SubBreedImgController>();
  final type = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(type == "single" ? AppStrings.breedTypes[2] : AppStrings.breedTypes[3]),
      body: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Obx(() => dropdownDecoration(DropdownButton<String>(
            underline: Container(),
            elevation: 5,
            hint: const Text(AppStrings.breedSelect),
            value: subBreedImgController.mainDropDownSelectedValue.value.isNotEmpty
                ? subBreedImgController.mainDropDownSelectedValue.value
                : dashBoardController.breedList?[0],
            items: dashBoardController.breedList!.map((item) {
              return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ));
            }).toList(),
            icon: const Icon(Icons.expand_circle_down,color: Colors.grey,),
            onChanged: (String? value) {
              subBreedImgController.mainDropDownSelectedValue.value = value!;
              subBreedImgController.subBreedDropDownList.clear();
              subBreedImgController.subDropDownSelectedValue.value = "";
              subBreedImgController.fetchSubBreedImage(type,dashBoardController,"mainCategory");
            },
          ))),
        ),
        Obx(() => subBreedImgController.subBreedDropDownList.isNotEmpty ?
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: dropdownDecoration(DropdownButton<String>(
            underline: Container(),
            elevation: 5,
            hint: const Text(AppStrings.breedSelect),
            value: subBreedImgController.subDropDownSelectedValue.value.isNotEmpty
                ? subBreedImgController.subDropDownSelectedValue.value
                : subBreedImgController.subBreedDropDownList.isNotEmpty ? subBreedImgController.subBreedDropDownList[0] : "",
            items: subBreedImgController.subBreedDropDownList.map((item) {
              return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ));
            }).toList(),
            icon: const Icon(Icons.expand_circle_down,color: Colors.grey,),
            onChanged: (String? value) {
              subBreedImgController.subDropDownSelectedValue.value = value!;
              subBreedImgController.fetchSubBreedImage(type,dashBoardController,"subCategory");
            },
          )),
        ) : Container()),
        const SizedBox(
          height: 20,
        ),
        if (type == "single")
          Obx(() => subBreedImgController.imgPath.isNotEmpty
              ? Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
    ),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Image.network(
      subBreedImgController.imgPath.value,
    fit: BoxFit.cover,
    ),
    ))
              : displayMsg()),
        if (type == "list")
          Obx(() => subBreedImgController.imgSubBreedList.isNotEmpty
              ? ListView.builder(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      subBreedImgController.imgSubBreedList[index],
                      fit: BoxFit.cover,
                    ),
                  ));
            },
            itemCount: subBreedImgController.imgSubBreedList.length,
          )
              : displayMsg())
      ]),),
    );
  }
}
