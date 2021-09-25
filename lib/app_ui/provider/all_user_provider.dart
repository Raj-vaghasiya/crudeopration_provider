import 'package:flutter/material.dart';
import 'package:office/db/modal_class.dart';

import '../ui/material_app.dart';

class AllDataProvider extends Object with ChangeNotifier {

  late List<User> allUser;

  allUsers() async {
    var data = await FloorUserDb().userDAO.getAllUser();
    allUser = data;
    print(data);
    notifyListeners();
  }
}
