import 'package:flutter/material.dart';
import 'package:office/db/floor.dart';
import 'package:office/db/userDAO.dart';

import 'splash_screen.dart';


class FloorApp extends StatefulWidget {
  const FloorApp({Key? key}) : super(key: key);

  @override
  _FloorAppState createState() => _FloorAppState();
}

class _FloorAppState extends State<FloorApp> {
  @override
  void initState() {
    FloorUserDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class FloorUserDb {
  static final FloorUserDb _db = FloorUserDb._internal();
  late UserDatabase database;
  late UserDAO userDAO;

  factory FloorUserDb() {
    return _db;
  }

  FloorUserDb._internal() {
    builder();
  }

  builder() async {
    database = await $FloorUserDatabase.databaseBuilder('User.db').build();
    userDAO = database.userDAO;
  }
}