import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kategori/bindings/kategori_binding.dart';
import '../modules/kategori/views/kategori_view.dart';
import '../modules/kategori_create/bindings/kategori_create_binding.dart';
import '../modules/kategori_create/views/kategori_create_view.dart';
import '../modules/kategori_update/bindings/kategori_update_binding.dart';
import '../modules/kategori_update/views/kategori_update_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI,
      page: () => const KategoriView(),
      binding: KategoriBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI_CREATE,
      page: () => const KategoriCreateView(),
      binding: KategoriCreateBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI_UPDATE,
      page: () => const KategoriUpdateView(),
      binding: KategoriUpdateBinding(),
    ),
  ];
}
