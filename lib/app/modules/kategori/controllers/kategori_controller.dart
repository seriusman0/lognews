import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class KategoriController extends GetxController {
  static const String url = 'http://192.168.88.244/lognews2022/api/kategori/';
  RxList<String> kategoriC = ['Loading'].obs;
  RxList<int> idKategoriC = [0].obs;

  Future<RxList<String>> getKategori() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        kategoriC.removeRange(0, kategoriC.length);
        idKategoriC.removeRange(0, idKategoriC.length);
        for (int i = 0; i < (json.decode(response.body).length); i++) {
          kategoriC.add(jsonDecode(response.body)[i]['nama']);
          idKategoriC.add(int.parse(jsonDecode(response.body)[i]['id']));
        }
      }
      print(kategoriC.value.toString());
    } catch (e) {
      print("Error $e");
    }
    return kategoriC;
  }

  void delete(int id) async {
    try {
      final response = await http.get(Uri.parse("${url}/delete.php?id=$id"));
      if (response.statusCode == 200) {
        Get.snackbar("Berhasil", "Berhasil Menghapus ID $id");
      }
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  void onReady() {
    super.onReady();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) => getKategori());
  }
}
