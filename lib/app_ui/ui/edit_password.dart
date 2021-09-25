import 'package:flutter/material.dart';
import 'package:office/app_ui/provider/edit_password_controller.dart';
import 'package:office/app_ui/provider/home_edit_provider.dart';
import 'package:provider/provider.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: context.read<EditPasswordProvider>().editFormKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: context.read<EditPasswordProvider>().oldPasswordController,
                      decoration: InputDecoration(
                        labelText: "Old password",
                        contentPadding: new EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";
                        if (val != context.read<HomeEditScrProvider>().editUser[0].password) {
                          return "enter a valid password";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: context.read<EditPasswordProvider>().newPasswordController,
                      decoration: InputDecoration(
                        labelText: "New password",
                        contentPadding: new EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";
                        if (val == context.read<HomeEditScrProvider>().editUser[0].password)
                          return "please,enter a new password";
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: context.read<EditPasswordProvider>().newPasswordMatchController,
                      decoration: InputDecoration(
                        labelText: "New password",
                        contentPadding: new EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";
                        if (val == context.read<HomeEditScrProvider>().editUser[0].password)
                          return "please,enter a valid password";
                        if (val != context.read<EditPasswordProvider>().newPasswordController.text)
                          return "Not Match";
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<EditPasswordProvider>().editPasswordButton(context);
                    },
                    child: Text('Done'),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
