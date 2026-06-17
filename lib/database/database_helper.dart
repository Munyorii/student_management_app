import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    }

    _db = await createDatabase();

    return _db!;
  }

  Future<Database> createDatabase() async {
    String path = join(await getDatabasesPath(), "student.db");

    return openDatabase(
      path,

      version: 1,

      onCreate: (db, version) {
        db.execute("""

CREATE TABLE users(

id INTEGER PRIMARY KEY AUTOINCREMENT,

email TEXT,

password TEXT

)

""");

        db.execute("""

CREATE TABLE students(

id INTEGER PRIMARY KEY AUTOINCREMENT,

name TEXT,

email TEXT,

course TEXT,

year TEXT,

phone TEXT

)

""");

        db.execute("""

CREATE TABLE attendance(

id INTEGER PRIMARY KEY AUTOINCREMENT,

studentId INTEGER,

date TEXT,

status TEXT

)

""");
      },
    );
  }

  String encryptPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  Future registerUser(String email, String password) async {
    final db = await database;

    await db.insert("users", {
      "email": email,

      "password": encryptPassword(password),
    });
  }

  Future loginUser(String email, String password) async {
    final db = await database;

    var result = await db.query(
      "users",

      where: "email=? AND password=?",

      whereArgs: [email, encryptPassword(password)],
    );

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }

  Future addStudent(Map<String, dynamic> student) async {
    final db = await database;

    return db.insert("students", student);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await database;

    return db.query("students");
  }
}
