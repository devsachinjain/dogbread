import 'package:get/get.dart';
import '../controllers/breedimg_controller.dart';

class BreedImgBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BreedImgController>(BreedImgController());
  }
}
