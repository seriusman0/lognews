import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kategori_update_controller.dart';

class KategoriUpdateView extends GetView<KategoriUpdateController> {
  const KategoriUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Update'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Nama Kategori",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Obx(
                () => TextField(
                  controller: controller.nameC.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  controller.submit();
                },
                child: Text("Update")),
          ],
        ),
      ),
    );
  }
}
