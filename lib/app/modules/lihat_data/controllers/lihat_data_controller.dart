import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class LihatDataController extends GetxController {
  RxList<Map<String, dynamic>> users = RxList<Map<String, dynamic>>([]);
  Future<void> getUsers() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
    );

    // query untuk mengambil semua data dari tabel users
    final List<Map<String, dynamic>> maps = await db.query('users');

    users.value = maps;
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
