import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';

  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> save(Contact contact) async {
    final Database database = await createDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.fullName;
    contactMap[_accountNumber] = contact.accountNumber;
    return database.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Contact> contactList = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        fullName: row[_name],
        accountNumber: row[_accountNumber],
      );
      contactList.add(contact);
    }

    return Future.delayed(Duration(seconds: 1), () {
      return contactList;
    });
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.fullName;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        fullName: row[_name],
        accountNumber: row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
