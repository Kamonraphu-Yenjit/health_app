import 'package:flutter/material.dart';
import 'package:testt/register.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:testt/screen_play.dart';
import 'package:testt/user_model.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String user = "";

  String pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              //Image.asset('assets/bmw.jpg'),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'back... ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),
              Image.asset('assets/doctor.png'),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: TextField(
                      onChanged: (value) => user = value.trim(),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          border: InputBorder.none,
                          hintText: 'Email'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: TextField(
                      onChanged: (value) => pass = value.trim(),
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          border: InputBorder.none,
                          hintText: 'Password'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: 480.0,
                  height: 40.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey, // background
                      onPrimary: Colors.yellow, // foreground
                    ),
                    onPressed: () {
                      print('user= $user,password = $pass');
                      //print(a.key.toString());
                      if (user == '' || pass == '') {
                        showw(context, 'Error!!',
                            'Type your email and password again!!');
                      } else {
                        //print(regis.email.length);
                        checkAuthen();
                        //showw(context, 'true', 'Your pasword is 123456');

                      }
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return register();
                      }));
                    },
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Text(
                        "Register now?",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('---- OR ----',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      IconData(0xee39, fontFamily: 'MaterialIcons'),
                      color: Colors.blue,
                      size: 40.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      IconData(0xf521, fontFamily: 'MaterialIcons'),
                      color: Colors.blue,
                      size: 40.0,
                    ),
                  ),
                ],
              )
            ])),
          )),
    );
  }

  Future<Null> checkAuthen() async {
    String path =
        'http://localhost/watch/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(path).then((value) {
      print('### value= $value ####');
      if (value.toString() != 'null') {
        var result = json.decode(value.data);
        print('### result = $result ###');

        for (var item in result) {
          UserModel model = UserModel.fromMap(item);
          // print('Welcome .......................................................');
          if (pass == model.pass) {
            showw(context, 'True', 'Go to account $user');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: ((context) => Myservice(userModel: model))),
                (route) => false);
          } else {
            showw(context, 'Password fail', 'Please try again');
          }
        }
      } else {
        showw(context, 'Try again',
            'Not have $user in this account in my database');
      }
    });
  }

  Future<dynamic> showw(BuildContext context, String first, String last) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '$first',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
            content: Text('$last'),
          );
        });
  }
}
