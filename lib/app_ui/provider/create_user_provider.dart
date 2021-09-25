import 'package:flutter/material.dart';
import 'package:office/app_ui/ui/home_page.dart';
import 'package:office/db/modal_class.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/material_app.dart';
import 'all_user_provider.dart';

class CreateUserScrProvider extends ChangeNotifier{

  final createUserFormkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController fristNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  String _selectRadio = "male";


  adduser() async {
    var emp = User(
      fristName: fristNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: conformPasswordController.text,
     gender: selectRadio
    );
    await FloorUserDb().userDAO.inserttUser([emp]);
    notifyListeners();
  }

  singUpButton(BuildContext context) async {
    if (createUserFormkey.currentState!.validate())  {
      adduser();
      Provider.of<AllDataProvider>(context, listen: false).allUsers();
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString('seen', '123');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('key', emailController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    }
  }

  String get selectRadio => _selectRadio;

  radioButton(value){
    _selectRadio = value;
    notifyListeners();
  }
}

// class RadioButton extends ChangeNotifier{
//
//   int _selectRadio = 0;
//
//   int get selectRadio => _selectRadio;
//
//   radioButton(int value){
//     _selectRadio = value;
//     notifyListeners();
//   }
// }

