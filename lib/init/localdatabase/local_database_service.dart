import '../../model/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

import 'ILocalDatabaseService.dart';

class LocalDatabaseService implements ILocalDatabaseService {
  static LocalDatabaseService _instance = LocalDatabaseService._init();
  static LocalDatabaseService get instance => _instance;

  LocalDatabaseService._init();

  Future<void> get database async {
    if (_db != null) return;
    await initDb();
  }

  Database? _db;
  final int _version = 1;
  final String _tableName = 'transactions';
  String _path = "";
  Future<void> initDb() async {
    try {
      _path = await getDatabasesPath() + 'transactions.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY , category_id INTEGER, date STRING, description STRING, name STRING, price REAL, project_id INTEGER, status INTEGER, transaction_type INTEGER)",
          );
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    List<Map<String, dynamic>> transactions = await _db!.query('transactions');
    return transactions.map((data) => TransactionModel.fromJson(data)).toList();
  }

  Future<int> insert(TransactionModel transaction) async {
    return await _db!.insert(_tableName, transaction.toJson());
  }

  Future<void> deleteDb() async {
    await _db!.delete(_tableName);
    deleteDatabase(_path);
    _db = null;
  }
}
