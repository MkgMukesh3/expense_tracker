import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'expenses_db.dart';

class DbHelper {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = "expenses.db";
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async {
    await ExpensesDB.createTables(database);
  }

//   static Future<sql.Database> db() async {
//     return sql.openDatabase("localDatabase.db", version: 1,
//         onCreate: (sql.Database database, int version)async {
//       await createTables(database);
//     });
//   }
}
