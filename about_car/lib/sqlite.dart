// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:flutter/widgets.dart';
// import 'package:path/path.dart';

// class ResultCode {
//   final int id;
//   final String code;
//   final String update_date;
//   const ResultCode(
//       {required this.id, required this.code, required this.update_date});

//   // Implement toString to make it easier to see information about
//   // each dog when using the print statement.
//   @override
//   String toString() {
//     return 'ResultCode{id: $id, code: $code, update_date: $update_date}';
//   }

//   factory ResultCode.fromMap(Map<String, dynamic> json) => ResultCode(
//       id: json["id"], code: json["code"], update_date: json["update_date"]);
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'code': code,
//       'update_date': update_date,
//     };
//   }
// }

// class DatabaseHelper {
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   static Database? _database;
//   Future<Database> get database async => _database ??= await _initDatabase();

//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'result.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//     CREATE TABLE result(
//       id INTEGER PRIMARY KEY,
//       code TEXT,
//       update_date TEXT
//     )
//     ''');
//   }

//   Future<int> add(ResultCode result) async {
//     Database db = await instance.database;
//     return await db.insert('result', result.toMap());
//   }

//   Future<List<ResultCode>> getall() async {
//     Database db = await instance.database;
//     var retults = await db.query('result', orderBy: 'id');
//     List<ResultCode> list = retults.isNotEmpty
//         ? retults.map((c) => ResultCode.fromMap(c)).toList()
//         : [];
//     return list;
//   }

//   Future<void> delete() async {
//     final db = await database;
//     db.delete('result');
//   }
// }
