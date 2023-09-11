import 'package:expense_tracker/db/db_helper.dart';
import 'package:expense_tracker/model/expenses_model.dart';
import 'package:sqflite/sqflite.dart';

class ExpensesDB {
  final tableName = "expanses";
  static Future<void> createTables(Database database) async {
    await database.execute('''CREATE TABLE items(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT,
  amount DOUBLE,
  category TEXT,
  expandedDate TEXT
)''');
  }

  static Future<int> createItems(
      String name, double amount, String category, String expandedDate) async {
    final db = await DbHelper().database;

    final data = {
      "name": name,
      "amount": amount,
      "category": category,
      "expandedDate": expandedDate
    };
    print("data $data");
    return await db.insert('items', data);
  }

  Future<List<ExpensesModel>> fetchAll() async {
    final database = await DbHelper().database;
    final expenseData =
        await database.rawQuery('''SELECT * from items ORDER BY id''');
    return expenseData
        .map((expensesModel) => ExpensesModel.fromDatabase(expensesModel))
        .toList();
  }

  Future<void> delete(int id) async {
    final database = await DbHelper().database;
    await database.rawDelete('''DELETE FROM items WHERE id = ?''', [id]);
  }
}
