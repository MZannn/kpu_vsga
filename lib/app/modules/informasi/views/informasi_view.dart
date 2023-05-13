import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/informasi_controller.dart';

class InformasiView extends GetView<InformasiController> {
  const InformasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InformasiView'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text(
              "Pemilihan umum atau Pemilu adalah proses pemilihan yang dilakukan secara demokratis oleh rakyat untuk memilih pemimpin yang akan mewakili mereka dalam pemerintahan. Pemilihan umum merupakan salah satu aspek penting dalam sistem demokrasi karena memberikan hak suara kepada rakyat untuk memilih pemimpin mereka secara bebas dan adil.",
              textAlign: TextAlign.justify,
            )
          ],
        ));
  }
}
