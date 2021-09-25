import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import 'intro_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
   // check();
    Timer(Duration(seconds: 2), () => check());
    super.initState();
  }


  Future cheeckLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _key = prefs.getString('key');
    print(_key);
    if(_key == null){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new LogInScreen(),
          ));
    }else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => new HomePage(),
        ),);
    }
  }

  Future check() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? _seen = pref.getString('seen');
    pref.setString('seen', 'abc');
    print(_seen);
    if (_seen == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new IntroScreen(),
          ),
      );
    } else {
      cheeckLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color:  Colors.blue,
                gradient: LinearGradient(
                  colors: [ Colors.blue, Colors.blueGrey],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 75.0,
                  child: Icon(
                    Icons.account_balance,
                    color: Color(0xff0F2027),
                    size: 50.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                Text(
                   "SpalshScreen",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
