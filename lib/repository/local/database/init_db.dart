import 'package:sqflite/sqflite.dart';
import 'package:wswork_app/repository/local/lead_repository.dart';
import 'package:wswork_app/repository/local/user_repository.dart';

class InitDB {

  static Future<Database> initDatabase() async {
    print('init DB');
    final pathDB = await getDatabasesPath();
    final localDB = '${pathDB}local.db';

    return openDatabase(localDB, version: 1,
      onCreate: (Database db, int version) async {
        const String sqlUser = 'CREATE TABLE IF NOT EXISTS ${UserRepository.tableUser}('
            '${UserRepository.idUserColumn} INTEGER PRIMARY KEY AUTOINCREMENT, '
            '${UserRepository.nameColumn} TEXT, '
            '${UserRepository.emailColumn} TEXT, '
            '${UserRepository.passwordColumn} TEXT, '
            '${UserRepository.phoneColumn} TEXT)';
        const String sqlLead = 'CREATE TABLE IF NOT EXISTS ${LeadRepository.tableLead}('
            '${LeadRepository.idUserColumn} INTEGER, '
            '${LeadRepository.idLeadColumn} INTEGER PRIMARY KEY AUTOINCREMENT, '
            '${LeadRepository.nameLeadColumn} TEXT, '
            '${LeadRepository.dateLeadColumn} TEXT, '
            '${LeadRepository.timeLeadColumn} TEXT)';
        await db.execute(sqlUser);
        await db.execute(sqlLead);
      }
    );
  }
}


