import 'package:fifth_exam/data/models/breaking_news/breaking_news_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalDatabase {
  static String tableName = "NotificationBreakingNews";
  static final LocalDatabase getInstance = LocalDatabase._init();
  static Database? _database;

  factory LocalDatabase() {
    return getInstance;
  }

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("boshqa.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: (db, ver) async {
      String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
      String textType = "TEXT";

      await db.execute('''
    CREATE TABLE $tableName (
    ${BreakingNewsFields.id} $idType,
    ${BreakingNewsFields.newsTitle} $textType,
    ${BreakingNewsFields.description} $textType,
    ${BreakingNewsFields.dateTime} $textType,
    ${BreakingNewsFields.newsImage} $textType
    )
    ''');
    });
  }

  LocalDatabase._init();

  static Future<BreakingNewsModel> addBreakingNews(
      BreakingNewsModel notificationModel) async {
    final db = await getInstance.getDb();
    final id = await db.insert(tableName, notificationModel.toJson());
    return notificationModel.copyWith(id: id);
  }

  static Future<List<BreakingNewsModel>> getAllBreakingNews() async {
    var database = await getInstance.getDb();
    var listOfTodos = await database.query(tableName, columns: [
      BreakingNewsFields.id,
      BreakingNewsFields.dateTime,
      BreakingNewsFields.newsImage,
      BreakingNewsFields.newsTitle,
      BreakingNewsFields.description,
    ]);

    var list = listOfTodos.map((e) => BreakingNewsModel.fromJson(e)).toList();

    return list;
  }

  static Future<int> deleteAllBreakingNews() async {
    final db = await getInstance.getDb();
    return await db.delete(tableName);
  }

  static Future<int> deleteBreakingNewsById({required int id}) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}