import 'package:flutter/material.dart';
import 'package:office/app_ui/provider/login_provider.dart';
import 'package:provider/provider.dart';

import 'Create_user.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_outlined),
        title: Text('LogIn Page '),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: context.read<LoginScrProvider>().globalFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: context.read<LoginScrProvider>().emailController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(15.0),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (val) {
                      RegExp regex = new RegExp( r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?)*$");
                      if (!regex.hasMatch(val!)) {
                        return 'Enter a valid email address';
                      } else {
                        return null;
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                    controller: context.read<LoginScrProvider>().passwordController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.all(15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return "can't empty null";
                      }
                      return null;
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("you don't have an account,"),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateUser()));
                    },
                    child: Text(
                      "create account.",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<LoginScrProvider>().login(context);
                  },
                  child: Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
