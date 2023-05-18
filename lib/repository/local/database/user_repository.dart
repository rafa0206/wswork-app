import 'package:sqflite/sqflite.dart';
import 'package:wswork_app/entities/user.dart';

class UserRepository {
  _getDatabase() async {
    final pathDB = await getDatabasesPath();
    final localDB = '${pathDB}local.db';

    var result = await openDatabase(localDB, version: 1, onCreate: _createDB);
    print('banco criado ou recuperado: ' + result.isOpen.toString());
    return result;
  }

  void _createDB(Database db, int version) async {
    const String sql =
        'CREATE TABLE IF NOT EXISTS t_usuario('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'nome TEXT, '
        'email TEXT, '
        'senha TEXT, '
        'telefone INTEGER, '
        'compra TEXT)';
    await db.execute(sql);
  }

  registerUser(User user) async {
    Database db = await _getDatabase();
    var result = await db.insert('t_usuario', user.toJson());
    print('Usuario criado: ' + result.toString());
    return result;
  }

}
