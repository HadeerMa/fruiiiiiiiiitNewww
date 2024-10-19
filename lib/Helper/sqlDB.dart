import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqldb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    String DataBasePath = await getDatabasesPath();
    String path = join(DataBasePath, 'salas.db');
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 3, onUpgrade: _onupgrade);
    return mydb;
  }

  _onupgrade(Database db, int oldversion, int newversion) {
    print("on upgrade **********************");
  }

  _oncreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE 'SaladDB' (
      "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
      "name" TEXT NOT NULL
     )
''');
    print('created ********************');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
