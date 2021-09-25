import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:office/app_ui/provider/api_provider.dart';
import 'package:office/app_ui/provider/home_edit_provider.dart';
import 'package:office/app_ui/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_password.dart';
import 'edit_profile.dart';
import 'login_screen.dart';
import 'second_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(
        Duration.zero, () => context.read<HomeEditScrProvider>().foredit());
    Future.delayed(
        Duration.zero, () => context.read<ApiFetchDataProvider>().todosApiAllData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      drawer: drawerManu(),
      body: SafeArea(
        child: ListView(
          children: [
            Consumer<ApiFetchDataProvider>(builder: (_, api, __) {
              // ignore: unnecessary_null_comparison
              if (api == null) return CircularProgressIndicator();
              if (api.todosApiData.isEmpty) return Center(child: Text("No data"));
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: api.todosApiData.length,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    color: api.todosApiData[index].completed!
                        ? Colors.green
                        : Colors.red,
                    child: ListTile(
                      onTap: (){
                        context.read<ApiFetchDataProvider>().compactPostIdapiData(api.todosApiData[index].userId!);
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> CompectApidetail()));
                        },
                      title: Text("Id:${api.todosApiData[index].id.toString()}"),
                      subtitle: Text(
                          "Title:${api.todosApiData[index].title}\nCompleted${api.todosApiData[index].completed}"),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  drawerManu() {
    return Container(
      width: 300,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(180, 250, 250, 250),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(31, 38, 135, 0.4),
            blurRadius: 8.0,
          )
        ],
        border: Border(
          right: BorderSide(
            color: Colors.white70,
          ),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.white.withOpacity(0.2),
                    ]),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/profile.png"),
                      radius: 30.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Consumer<HomeEditScrProvider>(
                        builder: (_, value, __) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.editUser.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Center(
                                      child: Text(
                                          "${value.editUser[index].fristName} ${value.editUser[index].lastName}"),
                                    ),
                                    SizedBox(height: 5),
                                    Center(
                                      child: Text(
                                           "${value.editUser[index].email}"),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        context.read<HomeEditScrProvider>().foredit();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditProfileOfUser()));
                      },
                      leading: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      title: Text("Edit Profile"),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ForgotPassword()));
                      },
                      leading: Icon(
                        Icons.change_circle,
                        color: Colors.black,
                      ),
                      title: Text("Change password"),
                    ),
                    ListTile(
                      onTap: () async {
                        _showDaiologLogout(context);
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text("Log Out"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDaiologLogout(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Logout'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Are you Sure for Logout?'),
          ],
        ),
      ),
      actions: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('key');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LogInScreen()));
                context.read<LoginScrProvider>().emailController.clear();
                context.read<LoginScrProvider>().passwordController.clear();
              },
            ),
          ],
         ),
      ],
    );
    showDialog<void>(
        context: context,
        barrierDismissible: false,//user must tap button!
        builder: (BuildContext context) => alert);
  }
}
