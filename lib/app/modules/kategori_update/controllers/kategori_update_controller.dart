import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class KategoriUpdateController extends GetxController {
  static const String url = 'http://192.168.88.244/lognews2022/api/kategori/';
  Rx<int> id = 0.obs;
  var nameC = TextEditingController(text: "loading").obs;

  Future<void> read(int id) async {
    try {
      final response = await http.get(Uri.parse("${url}read.php?id=$id"));
      if (response.statusCode == 200) {
        this.nameC.value.text = jsonDecode(response.body)[0]['nama'];
      }
    } catch (e) {
      print("Error $e");
    }
  }

  Future submit() async {
    try {
      return await http.post(
        Uri.parse("${url}update.php"),
        body: {
          'id': this.id.value.toString(),
          'nama_kategori': nameC.value.text
        },
      ).then((value) {
        if (value.body.isNotEmpty) {
          var data = json.decode(value.body);
          print(data["message"]);
          Get.snackbar("Berhasil", "Berhasil Upadate ${nameC.value.text}");
          Get.offAllNamed(Routes.HOME, arguments: true);
        }
        Get.snackbar("Berhasil", "Update ${nameC.value.text} ");
      });
    } catch (e) {
      Get.snackbar("Gagal", "Update ${nameC.value.text} karena $e");
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      this.read(Get.arguments);
      this.id.value = Get.arguments;
    });
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
