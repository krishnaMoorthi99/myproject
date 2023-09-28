import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
class hi extends StatefulWidget {
  const hi({super.key});

  @override
  State<hi> createState() => _hiState();
}

class _hiState extends State<hi> {
  @override

  void initState(){
    super.initState();
    isLogin();
  }

  void isLogin()async {
SharedPreferences sp=await SharedPreferences.getInstance();
bool? isLogin=sp.getBool('isLogin')??false;

if(isLogin){
  Timer(Duration(seconds: 5),(){
    Navigator.pushReplacement(context as BuildContext,MaterialPageRoute(builder: (context)=>const MainPage() ));
  });
}
else{
  Timer(Duration(seconds: 5),(){
    Navigator.pushReplacement(context as BuildContext,MaterialPageRoute(builder: (context)=>const page()));
  });
}
  }

  Widget build(BuildContext context) {
    return Container(child: Image.asset('images/f.png'),);
  }
}
