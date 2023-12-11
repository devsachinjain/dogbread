import 'package:get/get.dart';
import '../controllers/subbreedimg_controller.dart';

class SubBreedImgBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SubBreedImgController>(SubBreedImgController());
  }
}
