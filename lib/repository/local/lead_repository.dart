import 'package:sqflite/sqflite.dart';
import 'package:wswork_app/entities/lead.dart';
import 'package:wswork_app/repository/local/database/init_db.dart';

class LeadRepository {

  static final LeadRepository instance = LeadRepository._();

  LeadRepository._();

  static const String tableLead = 'tb_compra';
  static const String idUserColumn = 'id_usuario';
  static const String idLeadColumn = 'id_compra';
  static const String nameLeadColumn = 'nome_compra';
  static const String dateLeadColumn = 'data_compra';
  static const String timeLeadColumn = 'horario_compra';

  late Database _database;

  Future<Database> get database async {
    _database = await InitDB.initDatabase();
    return _database;
  }

  registerLead(Lead lead) async {
    // Database db = await _getDatabase();
    Database db = _database;
    var result = await db.insert(tableLead, lead.toJson());
    print('Compra registrada: ' + result.toString());
    return result;
  }

  Future<List<Lead>> listAll() async {
    Database db = _database;
    List<Map<String, dynamic>> maps =
    await db.rawQuery('SELECT * FROM $tableLead');
    List<Lead>? leads = maps.map((e) {
      return Lead.fromJson(e);
    }).toList();
    return leads;
  }

  getLeadByIdUser(int idUser) async {
    Database db = _database;
    List<Map<String, dynamic>> maps = await db.query(tableLead,
        columns: [
          idUserColumn,
        ],
        where: '$idUserColumn = ?',
        whereArgs: [idUser]);
    List<Lead>? leads = maps.map((e) {
      return Lead.fromJson(e);
    }).toList();
    return leads;
  }

}