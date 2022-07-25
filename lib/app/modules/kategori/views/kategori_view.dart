import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../routes/app_pages.dart';
import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  const KategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.kategoriC.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 40,
                      child: Card(
                          child: Row(
                        children: [
                          Expanded(child: Text(controller.kategoriC[index])),
                          ElevatedButton(
                              onPressed: () {}, child: Icon(Icons.camera)),
                          ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.KATEGORI_UPDATE,
                                    arguments: controller.idKategoriC[index]);
                              },
                              child: Icon(Icons.edit)),
                          ElevatedButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  textCancel: "Batal",
                                  title: "Hapus Kategori",
                                  middleText: "Anda Yakin?",
                                  textConfirm: "Simpan",
                                  confirmTextColor: Colors.white,
                                  onConfirm: () {
                                    controller
                                        .delete(controller.idKategoriC[index]);
                                    Get.back();
                                    controller.getKategori();
                                  },
                                );
                              },
                              child: Icon(
                                Icons.delete_forever,
                              )),
                        ],
                      )),
                    ),
                  );
                })),
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.KATEGORI_CREATE);
              },
              child: Text("Tambah"))
        ],
      ),
    );
  }
}
