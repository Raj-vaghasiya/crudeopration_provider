import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office/app_ui/ui/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/material_app.dart';

class LoginScrProvider extends ChangeNotifier {
  TextEditingController fristNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  login(BuildContext context) async {
    var data = await FloorUserDb()
        .userDAO
        .loginData(emailController.text, passwordController.text);
    print(data);
    if (globalFormKey.currentState!.validate()) {
      if (data.isNotEmpty) {
        print("success");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // pref.setString('seen', '123');
        prefs.setString('key', emailController.text);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => HomePage()));
      } else {
        print('error');
        Fluttertoast.showToast(
            msg: "enter a valid email or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
