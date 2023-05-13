import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kpu/app/routes/app_pages.dart';

import '../controllers/lihat_data_controller.dart';

class LihatDataView extends GetView<LihatDataController> {
  const LihatDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Data'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.detailData,
                    arguments: controller.users[index]);
              },
              child: ListTile(
                title: Text(controller.users[index]['nik']),
                subtitle: Text(controller.users[index]['nama']),
              ),
            );
          },
        ),
      ),
    );
  }
}
