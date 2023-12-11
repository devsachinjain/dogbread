import 'package:flutter/material.dart';
import 'package:test_task_dogbreed/data/const/strings.dart';
import 'package:get/get.dart';
import 'package:test_task_dogbreed/data/controllers/dashboard_controller.dart';
import 'package:test_task_dogbreed/presentation/widgets/appbar.dart';
import 'package:test_task_dogbreed/presentation/widgets/image_card.dart';
import '../../data/controllers/breedimg_controller.dart';
import '../widgets/displayMsg.dart';
import '../widgets/dropdowndecoration.dart';

class ImageByBread extends StatelessWidget {
  ImageByBread({super.key});

  final dashBoardController = Get.find<DashBoardController>();
  final breedImgController = Get.find<BreedImgController>();
  final type = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(type == "single" ? AppStrings.breedTypes[0] : AppStrings.breedTypes[1]),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Obx(() => dropdownDecoration(DropdownButton<String>(
                  underline: Container(),
                  elevation: 5,
                  hint: const Text(AppStrings.breedSelect),
                  value: breedImgController.selectedValue.value.isNotEmpty
                      ? breedImgController.selectedValue.value
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
                    breedImgController.selectedValue.value = value!;
                    breedImgController.fetchBreedImage(type);
                  },
                ),)),
          ),
          const SizedBox(
            height: 20,
          ),
          if (type == "single")
            Obx(() => breedImgController.imgPath.isNotEmpty
                ? imgCard(breedImgController.imgPath.value)
                : displayMsg()),
          if (type == "list")
            Obx(() => breedImgController.imgBreedList.isNotEmpty
                ? ListView.builder(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return imgCard(breedImgController.imgBreedList[index]);
              },
              itemCount: breedImgController.imgBreedList.length,
            )
                : displayMsg())
        ]),
      ),
    );
  }
}
