import 'package:flutter/material.dart';

import 'login_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is an introScreen"),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonBar(

                    children: [
                      TextButton(onPressed: () {
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => LogInScreen(),),);
                      }, child: Text("Next >>>"),),
                    ],
                  ),
                ],
              )
            ],
          ),
      ),
    );
  }
}
