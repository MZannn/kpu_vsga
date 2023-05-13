import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kpu/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(
              height: 36,
            ),
            Image.network(
              "https://kpu.go.id/images/logo-kpu.png",
              height: 200,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.informasi);
              },
              child: const Text("Informasi"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.formEntry);
              },
              child: const Text("Form Entry"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.lihatData);
              },
              child: const Text("Lihat Data"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Keluar"),
            ),
          ],
        ),
      ),
    );
  }
}
