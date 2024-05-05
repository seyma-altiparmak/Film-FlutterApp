import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final String databaseName = "filmler_app.sqlite";

  static Future<Database> accessDatabase() async{
    String databasePath = join(await getDatabasesPath(),databaseName);

    if(await databaseExists(databasePath)){
      print(("Database already exists."));
    }else{
      ByteData data = await rootBundle.load("databases/$databaseName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes,flush: true);
      print(("Database copied."));
    }

    return openDatabase(databasePath);

  }
}