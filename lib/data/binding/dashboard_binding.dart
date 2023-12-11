import 'package:get/get.dart';
import 'package:test_task_dogbreed/data/controllers/dashboard_controller.dart';

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DashBoardController>(DashBoardController());
  }
}
