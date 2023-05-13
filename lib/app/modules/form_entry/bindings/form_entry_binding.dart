import 'package:get/get.dart';

import '../controllers/form_entry_controller.dart';

class FormEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormEntryController>(
      () => FormEntryController(),
    );
  }
}
