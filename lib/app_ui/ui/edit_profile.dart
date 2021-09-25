import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:office/app_ui/provider/home_edit_provider.dart';
import 'package:provider/provider.dart';

class EditProfileOfUser extends StatefulWidget {
  const EditProfileOfUser({Key? key}) : super(key: key);

  @override
  _EditProfileOfUserState createState() => _EditProfileOfUserState();
}

class _EditProfileOfUserState extends State<EditProfileOfUser> {


  @override
  void initState() {
    context.read<HomeEditScrProvider>().textfielddata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: context.read<HomeEditScrProvider>().editformkey,
              child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _textField(
                              context.read<HomeEditScrProvider>().fristNameEditController,
                              "FristName"),
                          _textField(
                             context.read<HomeEditScrProvider>().lastNameEditController,
                              "LastName"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                             controller: context.read<HomeEditScrProvider>().emailEditController,
                              decoration: InputDecoration(
                                labelText: 'Enter your email',
                                contentPadding: new EdgeInsets.all(8.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
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
                          ElevatedButton(
                            onPressed: () async {
                              context.read<HomeEditScrProvider>().editButton(context);
                            },
                            child: Text('Done'),
                          ),
                        ],
                      ),
              ),
        ],
      ),
    );
  }

  _textField(TextEditingController _controller, String _hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Enter your $_hintText',
          contentPadding: new EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
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
