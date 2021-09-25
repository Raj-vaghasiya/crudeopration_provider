import 'dart:async';

import 'package:floor/floor.dart';
import 'package:office/db/userDAO.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'modal_class.dart';

part 'floor.g.dart';

@Database(version:1,entities: [User])
abstract class UserDatabase extends FloorDatabase {
  UserDAO get userDAO;
}