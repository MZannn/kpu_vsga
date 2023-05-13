import 'package:sqflite/sqflite.dart';

// Definisi nama tabel dan kolom
const String tableNama = 'data';
const String columnId = 'id';
const String columnNIK = 'nik';
const String columnNama = 'nama';
const String columnNoHp = 'no_hp';
const String columnTglLahir = 'tgl_lahir';
const String columnAlamat = 'alamat';
const String columnJenisKelamin = 'jenis_kelamin';

class DatabaseHelper {
  // Instance database
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  // Method untuk inisialisasi database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDb();
    return _database;
  }

  // Method untuk membuat tabel dan kolom
  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final db = await openDatabase(
      '$path/nama_database.db',
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableNama (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnNIK TEXT,
            $columnNama TEXT,
            $columnNoHp TEXT,
            $columnTglLahir TEXT,
            $columnAlamat TEXT,
            $columnJenisKelamin TEXT
          )
        ''');
      },
      version: 1,
    );
    return db;
  }
}

class Data {
  int? id;
  String nik;
  String nama;
  String noHp;
  String tglLahir;
  String alamat;
  String jenisKelamin;

  Data({
    this.id,
    required this.nik,
    required this.nama,
    required this.noHp,
    required this.tglLahir,
    required this.alamat,
    required this.jenisKelamin,
  });

  // Method untuk mengubah objek menjadi map
  Map<String, dynamic> toMap() {
    return {
      columnNIK: nik,
      columnNama: nama,
      columnNoHp: noHp,
      columnTglLahir: tglLahir,
      columnAlamat: alamat,
      columnJenisKelamin: jenisKelamin,
    };
  }
}
