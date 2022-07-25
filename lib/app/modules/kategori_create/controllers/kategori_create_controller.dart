import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class KategoriCreateController extends GetxController {
  static const String url = 'http://192.168.88.244/lognews2022/api/kategori/';
  TextEditingController namaKategoriC = TextEditingController();

  Future submit() async {
    try {
      return await http.post(
        Uri.parse("${url}create.php"),
        body: {'nama_kategori': namaKategoriC.text},
      ).then((value) {
        if (value.body.isNotEmpty) {
          var data = json.decode(value.body);
          print(data["message"]);
          Get.snackbar("Berhasil", "Berhasil registrasi ${namaKategoriC.text}");
          Get.offAllNamed(Routes.HOME, arguments: true);
        }
        Get.snackbar("Berhasil", "Berhasil registrasi ${namaKategoriC.text} ");
      });
    } catch (e) {
      Get.snackbar("Gagal", "Gagal registrasi ${namaKategoriC.text} karena $e");
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
