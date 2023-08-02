import 'package:kidmath/model/score.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  String databaseName = "math.db";
  String tableName = "kidmath";
  String column_id = "id";
  String column_Mark = "correctMark";
  String column_article = "article";
  String column_category = "category";
  String column_name = "name";

  Future<Database> getDatabase() async {
    String dir = await getDatabasesPath();
    return openDatabase(path.join(dir, databaseName),
        onCreate: createDatabase, version: 1);
  }

  void createDatabase(Database db, int version) {
    String sql =
        'CREATE TABLE $tableName ($column_id INTEGER PRIMARY KEY AUTOINCREMENT, $column_Mark INTEGER,$column_article INTEGER,$column_category CHAR,$column_name CHAR)';
    db.execute(sql);
  }

  Future<int> insertData(Score score) async {
    Database db = await getDatabase();
    return db.insert(tableName, score.toMap());
  }

  Future<List<Score>> getAllData() async {
    Database db = await getDatabase();
    List<Map<String, Object?>> maps = await db.query(tableName);

    List<Score> view = maps.map((e) => Score.fromMap(e)).toList();
    return view;
  }
}
