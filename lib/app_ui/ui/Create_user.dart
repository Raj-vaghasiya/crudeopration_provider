import 'package:flutter/material.dart';
import 'package:office/app_ui/provider/create_user_provider.dart';
import 'package:provider/provider.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_box),
        title: Text('Create User Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              key: context.read<CreateUserScrProvider>().createUserFormkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _textField(
                      context.read<CreateUserScrProvider>().fristNameController,
                      "FristName"),
                  _textField(
                      context.read<CreateUserScrProvider>().lastNameController,
                      "LastName"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller:
                          context.read<CreateUserScrProvider>().emailController,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.all(15.0),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        RegExp regex = new RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$");
                        if (!regex.hasMatch(val!)) {
                          return 'Enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: context
                          .read<CreateUserScrProvider>()
                          .passwordController,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.all(15.0),
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: context
                          .read<CreateUserScrProvider>()
                          .conformPasswordController,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.all(15.0),
                        hintText: 'Conform password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";
                        if (val !=
                            context
                                .read<CreateUserScrProvider>()
                                .passwordController
                                .text) return "your password is not match";

                        return null;
                      },
                    ),
                  ),
                  Consumer<CreateUserScrProvider>(
                    builder: (_, provider, __) => Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: "male",
                                groupValue: provider.selectRadio,
                                onChanged: (value) {
                                  provider.radioButton(value);
                                }),
                            Text("Male"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "female",
                                groupValue: provider.selectRadio,
                                onChanged: (value) {
                                  provider.radioButton(value);
                                }),
                            Text("Female")
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<CreateUserScrProvider>()
                          .singUpButton(context);
                    },
                    child: Text('Singin'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textField(TextEditingController _controller, String _hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: new EdgeInsets.all(15.0),
          hintText: '$_hintText',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty)
            return "can't empty ${_hintText.toLowerCase()} null";

          return null;
        },
      ),
    );
  }
}
