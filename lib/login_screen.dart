import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class page extends StatefulWidget {
  const page({super.key});

  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  final ok = GlobalKey<FormState>();
  var me = TextEditingController();
  var me1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.green,
      title: Text('LOGIN PAGE',
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),),),
      body: SingleChildScrollView(
        child: Form(
          key: ok,
          child: Column(children: [SizedBox(height: 50,),
            Text('Login page',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
            SizedBox(height: 45,),
            TextFormField(controller: me,
              decoration: InputDecoration(

                  hintText: ' Enter Email',
                  labelText: 'email',

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter your email ';
                }
              },),
            SizedBox(height: 26,),
            TextFormField(controller: me1,
              decoration: InputDecoration(
                  hintText: 'enter password',
                  labelText: 'password',
                  suffixIcon: Icon(Icons.visibility_off),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'enter your password';
                }
              },
              obscureText: true,),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
              setState(() {
                if (ok.currentState!.validate()) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) =>
                      MainPage()));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('please fill the form ')));
                }
              });
            },
                child: Text('login',
                  style: TextStyle(color: Colors.red),))

          ],),
        ),
      ),);
  }
}
