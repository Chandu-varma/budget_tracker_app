import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
   
  static final DatabaseService instance = DatabaseService._init();

  static Database? _database;

   
  DatabaseService._init();

   
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('expenses.db');
    return _database!;
  }

   
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

   
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const doubleType = 'REAL NOT NULL';

    await db.execute('''
    CREATE TABLE expenses (
      id $idType,
      title $textType,
      amount $doubleType,
      date $textType,
      category $textType
    )
    ''');
  }

   
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
