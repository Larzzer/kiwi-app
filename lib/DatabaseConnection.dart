import 'package:eksamesprojekt_kiwi_app/MedlemsKartotek.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

import 'MedlemsKartotek.dart';

class Database extends WidgetsBindingObserver{
  static late PostgreSQLConnection _connection;
  static late var _memberList;
  static late var _fuelLeft;

  static Future<void> openConnection() async {
      _connection = PostgreSQLConnection(
        '192.168.86.34',
        5432,
        'boatdb',
        username: 'postgres',
        password: '123',
      );
      await _connection.open();
      await loadMembers();
  }

  static Future<List<Map<String, dynamic>>> executeSql(String sql) async {
    if (_connection == null) {
      await openConnection();
    }
    var results = await _connection!.query(sql);
    print('Query Results: $results');
    return results.map((row) => row.toTableColumnMap()).toList();
  }

  static List<Map<String, dynamic>> getMemberList()
  {
    return _memberList;
  }

  static double getFuelLeft()
  {
    return _fuelLeft;
  }

  static Future<void> loadFuel() async {
    final sql = 'SELECT "fuel-left" FROM fuel ORDER BY id DESC LIMIT 1;';
    var result = await Database.executeSql(sql);
    _fuelLeft = double.parse(result[0]["fuel"]["fuel-left"]);
  }

  static Future<void> loadMembers() async {
    final sql = 'SELECT "first-name",email,"phone-number","first-name","last-name" FROM members';
    _memberList = await Database.executeSql(sql);
  }

  static Future<void> closeConnection() async {
    assert(_connection != null, 'Connection must be initialized before closing');

    await _connection.close();
  }
}

