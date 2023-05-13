import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kpu/app/routes/app_pages.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class FormEntryController extends GetxController {
  RxBool isLoading = false.obs;
  late TextEditingController nikController;
  late TextEditingController namaController;
  late TextEditingController noHpController;
  late TextEditingController tglLahirController;
  late TextEditingController alamatController;
  late Database db;
  RxInt selectedValue = 1.obs;
  RxString alamat = ''.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openAppSettings();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> tglLahir(BuildContext context) async {
    MaterialLocalizations.of(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      tglLahirController.text = formattedDate;
      update();
    } else {
      Get.rawSnackbar(
        message: 'Silahkan Pilih Tanggal',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 10,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  void location() {
    getLocation().then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      alamatController.text = "${value.latitude}, ${value.longitude}";
    });
  }

  void updateSelectedValue(int value) {
    selectedValue.value = value;
  }

  Future<void> onSave() async {
    try {
      isLoading.value = true;
      var jk = selectedValue.value == 1 ? 'Laki - Laki' : 'Perempuan';
      await db.insert(
        'users',
        {
          'nik': nikController.text,
          'nama': namaController.text,
          'no_hp': noHpController.text,
          'tgl_lahir': tglLahirController.text,
          'alamat': alamatController.text,
          'jenis_kelamin': jk,
        },
      );

      Get.offAllNamed(Routes.home);

      isLoading.value = false;
    } catch (e) {
      Get.rawSnackbar(
        message: 'Gagal menyimpan data',
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        borderRadius: 10,
        duration: const Duration(seconds: 3),
      );

      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    isLoading.value = true;
    determinePosition();
    isLoading.value = false;
    nikController = TextEditingController();
    namaController = TextEditingController();
    noHpController = TextEditingController();
    tglLahirController = TextEditingController();
    alamatController = TextEditingController();
    db = await openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, nik TEXT, nama TEXT, no_hp TEXT, tgl_lahir TEXT, alamat TEXT, jenis_kelamin TEXT)',
        );
      },
      version: 1,
    );
    super.onInit();
  }
}
