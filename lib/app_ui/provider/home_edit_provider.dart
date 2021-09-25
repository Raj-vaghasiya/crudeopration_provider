import 'package:flutter/material.dart';
import 'package:office/db/modal_class.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/material_app.dart';
import 'all_user_provider.dart';

class HomeEditScrProvider extends ChangeNotifier{

  final editformkey = GlobalKey<FormState>();
  TextEditingController fristNameEditController = TextEditingController();
  TextEditingController lastNameEditController = TextEditingController();
  TextEditingController emailEditController = TextEditingController();
  late List<User> editUser;

  foredit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emailForEditUser = prefs.getString('key');
    var data = await FloorUserDb().userDAO.emailData(emailForEditUser!);
    editUser = data;
    notifyListeners();
  }

  textfielddata() {
    var user = editUser[0];
    fristNameEditController..text = user.fristName!;
    lastNameEditController..text = user.lastName!;
    emailEditController..text = user.email!;
  }

  editButton(BuildContext context){
    if (editformkey.currentState!.validate()) {
      context.read<HomeEditScrProvider>().updateForEdit(
          Provider.of<HomeEditScrProvider>(context,listen: false).editUser[0].id!);
      context.read<HomeEditScrProvider>().foredit();
      context.read<AllDataProvider>().allUsers();
      Navigator.pop(context);
      // print(context.read<DataProvider>().allUsers());
    }

  }

  updateForEdit(int id) async {
    await FloorUserDb().userDAO.updateForEdit(fristNameEditController.text, lastNameEditController.text, emailEditController.text, id);
    notifyListeners();
  }


}