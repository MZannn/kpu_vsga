import 'package:get/get.dart';

import '../controllers/lihat_data_controller.dart';

class LihatDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LihatDataController>(
      () => LihatDataController(),
    );
  }
}
