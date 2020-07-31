import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:mobx/mobx.dart';

class BD {
  static final BD _instance = new BD.internal();

  factory BD() => _instance;

  BD.internal();

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initBd();
    return _db;
  }

  initBd() async {
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();

    String caminho = join(documentoDiretorio.path, "bd_principal.db");

    var nossoBD = await openDatabase(caminho, version: 1, onCreate: _onCreate);

    return nossoBD;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE IF NOT EXISTS HISTORICO ( "
        " id INTEGER PRIMARY KEY, "
        " moeda_origem TEXT, "
        " valor_origem TEXT, "
        " moeda_converter TEXT, "
        " valor_convertido TEXT "
        "); ");
  }

  Future<List> getHistorico() async {
    var banco = await db;

    try {
      var res = await banco.rawQuery(""
          "select "
          "   moeda_origem, "
          "   valor_origem, "
          "   moeda_converter, "
          "   valor_convertido "
          "from HISTORICO ");
      return res.toList().asObservable();
    } on Exception catch (e) {
      print("Errro '$e'");
    }
  }

  Future gravarHistorico(Map historico) async{

    var banco = await db;
    try {
      return await banco.insert("HISTORICO", historico);
    } on DatabaseException catch (e) {
      print("ERRO: $e");
    }

  }

  Future zeraBanco() async{
    var banco = await db;
    return await banco.rawDelete("DELETE FROM HISTORICO");

  }
}
