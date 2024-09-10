import 'dart:io';
import 'package:backend/src/Model/UserModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataConnection {
  get table => null;

  Future<Database> initializeData() async {
    
    Directory tempDir = await getTemporaryDirectory();
    // ignore: unused_local_variable
    String tempPath = tempDir.path; 
    Directory appDocDir = await getApplicationDocumentsDirectory();
    // ignore: unused_local_variable
    String appDocPath = appDocDir.path; 
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'data.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $table(id INTEGER PRIMARY KEY, name TEXT, sex TEXT, age INTEGER, image TEXT)',
        );
      },
    );
  }

  Future<void> insertData(Person person) async {
    final db = await initializeData();
    await db.insert(table, person.fromJson());
    print('object was insert to database'); // Avoid 'print' calls in production code.
  }

  Future<List<Person>> getPersonData() async {
    final db = await initializeData();
    List<Map<String, dynamic>> result = await db.query(table);
    return result.map((e) => Person.toJson(e)).toList();
  }

  Future<void> deletePersonData(int id) async {
    final db = await initializeData();
    await db.delete(table, where: 'id=?', whereArgs: [id]);
  }

  Future<void> updatePersonData(Person person) async {
    final db = await initializeData();
    await db.update(table, person.fromJson(),
        where: 'id=?', whereArgs: [person.id]);
  }
}