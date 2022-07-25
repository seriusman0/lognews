import 'package:get/get.dart';

import '../controllers/kategori_update_controller.dart';

class KategoriUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KategoriUpdateController>(
      () => KategoriUpdateController(),
    );
  }
}
