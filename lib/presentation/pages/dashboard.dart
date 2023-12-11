import 'package:flutter/material.dart';
import 'package:test_task_dogbreed/data/const/strings.dart';
import 'package:get/get.dart';
import 'package:test_task_dogbreed/presentation/pages/sub_breed_image.dart';
import 'package:test_task_dogbreed/presentation/widgets/appbar.dart';

import '../../data/binding/breedimg_binding.dart';
import '../../data/binding/subbreedimg_binding.dart';
import 'breed_image.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  navigateTo(int index) {

    switch (index) {
      case 0:
        Get.to(() => ImageByBread(),
            binding: BreedImgBinding(), arguments: "single");
      case 1:
        Get.to(() => ImageByBread(),
            binding: BreedImgBinding(), arguments: "list");
      case 2:
        Get.to(() => ImageBySubBread(),
            binding: SubBreedImgBinding(), arguments: "single");
      case 3:
        Get.to(() => ImageBySubBread(),
            binding: SubBreedImgBinding(), arguments: "list");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appbar(AppStrings.dashboard),
      body: SingleChildScrollView(
        child: GridView.builder(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Card(
                color: Colors.teal[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(AppStrings.breedTypes[index],
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(height: 5),
                    const Icon(Icons.arrow_circle_right_outlined,color: Colors.black54,)
                  ],
                ),
              ),
              onTap: () =>navigateTo(index),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
        ),
      ),
    ));
  }
}
