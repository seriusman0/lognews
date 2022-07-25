import 'package:get/get.dart';

import '../controllers/kategori_create_controller.dart';

class KategoriCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KategoriCreateController>(
      () => KategoriCreateController(),
    );
  }
}
