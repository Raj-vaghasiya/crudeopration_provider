import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:office/app_ui/ui/material_app.dart';

import 'all_user_provider.dart';
import 'home_edit_provider.dart';

class EditPasswordProvider extends ChangeNotifier{

  final editFormKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordMatchController = TextEditingController();

  editPasswordButton(BuildContext context){
    if (editFormKey.currentState!.validate()) {
      updateForForgotpass(
          newPasswordMatchController.text,
          context.read<HomeEditScrProvider>().editUser[0].id!);
      context.read<AllDataProvider>().allUsers();
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Your changes is successful done!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }

  updateForForgotpass(password, id) async {
    await FloorUserDb().userDAO.updateForPassword(password, id);
  }
}