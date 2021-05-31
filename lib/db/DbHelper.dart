import 'package:responsive_and_adaptive_app/db/model/Transaction.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();

  AppDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb("transactions.db");
    return _database!;
  }

  Future<Database> _initDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${tableTransaction} (
      ${TransactionField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${TransactionField.description} TEXT,
      ${TransactionField.amount} REAL,
      ${TransactionField.timeStamp} INTEGER
    )
    ''');
  }

  Future<List<TransactionInfo>> getListTransaction() async{
    final db = await instance.database;
    final rs = await db.rawQuery("select * from $tableTransaction");
    return rs.map((json) => TransactionInfo.fromJson(json)).toList();
  }

  Future<TransactionInfo> addTransaction(TransactionInfo trans) async {
    final db = await instance.database;
    final newId = await db.insert(tableTransaction, trans.toJson());
    return trans.copy(id: newId);
  }

  Future<int> deleteTransaction(TransactionInfo trans) async{
    final db = await instance.database;
    return await db.delete(tableTransaction,where: "${TransactionField.id} = ?",whereArgs: [trans.id]);
  }
}
