import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_data_controller.dart';

class DetailDataView extends GetView<DetailDataController> {
  const DetailDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Data'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Text(
              "Data Pemilih",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(0.2),
                2: FlexColumnWidth(3),
              },
              children: [
                _buildTableRow('NIK', Get.arguments['nik']),
                _buildTableRow('Nama', Get.arguments['nama']),
                _buildTableRow('No. HP', Get.arguments['no_hp']),
                _buildTableRow('Tanggal Lahir', Get.arguments['tgl_lahir']),
                _buildTableRow('Jenis Kelamin', Get.arguments['jenis_kelamin']),
                _buildTableRow('Alamat', Get.arguments['alamat']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            label,
            textAlign: TextAlign.left,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(":"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(value),
        ),
      ],
    );
  }
}
