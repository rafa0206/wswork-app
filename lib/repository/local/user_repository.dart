import 'package:sqflite/sqflite.dart';
import 'package:wswork_app/entities/user.dart';
import 'package:wswork_app/repository/local/database/init_db.dart';

class UserRepository {
  static final UserRepository instance = UserRepository._();

  UserRepository._();

  static const String tableUser = 'tb_usuario';
  static const String idUserColumn = 'id';
  static const String nameColumn = 'nome';
  static const String emailColumn = 'email';
  static const String passwordColumn = 'senha';
  static const String phoneColumn = 'telefone';

  Database? _database;

  Future<Database?> get database async {
    _database = await InitDB.initDatabase();
    return _database;
  }

  registerUserOnDB(User user) async {
    // Database db = await _getDatabase();
    Database? db = await database;
    var result = await db?.insert(tableUser, user.toJson());
    print('Usuario criado: ' + result.toString());
    return result;
  }

  getUserByEmailPassword(String email, String password) async {
    // Database db = await _getDatabase();
    Database? db =  await database;
    List<Map> users = await db!.query(tableUser,
        columns: [
          idUserColumn,
          nameColumn,
          emailColumn,
          passwordColumn,
          phoneColumn,
        ],
        where: '$emailColumn = ? AND $passwordColumn = ?',
        whereArgs: [email, password]);
    if (users.isNotEmpty) {
      var user = users.first;

      print(
          'Conta:\n id: ' + user['id'].toString() + '\n nome: ' + user['nome']);

      // return User.fromJson(user);
      return User.fromJson(user as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  getUserIdByEmailPassword(String email, String password) async {
    // Database db = await _getDatabase();
    Database? db = await database;
    List<Map> users = await db!.query(tableUser,
        columns: [
          idUserColumn,
          nameColumn,
          emailColumn,
          passwordColumn,
          phoneColumn,
        ],
        where: '$emailColumn = ? AND $passwordColumn = ?',
        whereArgs: [email, password]);
    if (users.isNotEmpty) {
      var user = users.first;

      int userId = user['id'];

      return userId;
    } else {
      return null;
    }
  }

  getUser(int id) async {
    Database? db = await database;
    List<Map> users = await db!.query(tableUser,
        columns: [
          idUserColumn,
          nameColumn,
          emailColumn,
          passwordColumn,
          phoneColumn,
        ],
        where: '$idUserColumn = ?',
        whereArgs: [id]);
    if (users.isNotEmpty) {
      var user = users.first;

      print('id: ' + user['id'].toString() + '\n nome: ' + user['nome']);

      // return User.fromJson(user);
      return User.fromJson(user as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<String?> emailExists(String email) async {
    Database? db = await database;
    List<Map> users = await db!.query(tableUser,
        columns: [
          idUserColumn,
          nameColumn,
          emailColumn,
          passwordColumn,
          phoneColumn,
        ],
        where: '$emailColumn = ?',
        whereArgs: [email]);
    if (users.isNotEmpty) {
      var user = users.first;

      String userEmail = user['email'];

      return userEmail;

      // return User.fromJson(maps.first as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}

// _getDatabase() async {
//   final pathDB = await getDatabasesPath();
//   final localDB = '${pathDB}local.db';
//
//   var result = await openDatabase(localDB, version: 1, onCreate: _createDB);
//   print('banco criado ou recuperado: ' + result.isOpen.toString());
//   return result;
// }
//
// void _createDB(Database db, int version) async {
//   const String sql = 'CREATE TABLE IF NOT EXISTS t_usuario('
//       'id INTEGER PRIMARY KEY AUTOINCREMENT, '
//       'nome TEXT, '
//       'email TEXT, '
//       'senha TEXT, '
//       'telefone INTEGER, '
//       'compra TEXT)';
//   await db.execute(sql);
// }
