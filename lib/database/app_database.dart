import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'database.db');

  return openDatabase(path, onCreate: (Database database, int version) {
    database.execute(ContactDao.tableSql).then((value) => null);
  }, version: 3, onDowngrade: onDatabaseDowngradeDelete);
}
