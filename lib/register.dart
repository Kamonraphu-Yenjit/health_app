import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:testt/login_page.dart';
import 'package:dio/dio.dart';
import 'package:testt/user_register.dart';
class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String user = '';
  String passd = '';
  String f_name = '';
  String l_name = '';
  String iot = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text('Register !!'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey,
      ),
      body: Form(
    child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/doctor.png'),
            SizedBox(
              height: 20,
            ),
            Text('กรอกแบบฟอร์ม'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: TextField(
                    onChanged: (value) => user = value.trim(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none,
                        hintText: 'Username'),
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
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: TextField(
                    onChanged: (value) => passd = value.trim(),
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password_outlined),
                        border: InputBorder.none,
                        hintText: 'Number Password'),
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
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: TextField(
                    onChanged: (value) => f_name = value.trim(),
                    //obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: 'First Name'),
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
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: TextField(
                    onChanged: (value) => l_name = value.trim(),
                    //obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: 'Last Name'),
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
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: TextField(
                    onChanged: (value) => iot = value.trim(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        border: InputBorder.none,
                        hintText: 'Iot id type number 1 - 9'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 450.0,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, // background
                    onPrimary: Colors.yellow, // foreground
                  ),
                  onPressed: () {
                    print('user= $user,password = $passd');
                    if (user == '' || passd == '' || iot == '') {
                      showwre(context, 'Error!!',
                          'Type your email and password again!!');
                    } else {
                      check_register();
                      print('testregister $user $iot');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return login();
                      }));
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("if you haven't any account ",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return login();
                    }));
                  },
                  child: new Padding(
                    padding: new EdgeInsets.all(10.0),
                    child: new Text(
                      "sign in?",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
  Future<Null> check_register() async {
    String path =
        'http://localhost/watch/insertData.php?user=$user&pass=$passd&f_name=$f_name&l_name=$l_name&iot=$iot';
    await Dio().get(path).then((value) {
      print('### value= $value ####');
      if (value.toString() != 'null') {
        var result = json.decode(value.data);
        print('### result = $result ###');

        for (var item in result) {
          User_register model = User_register.fromMap(item);
          print(
              'Welcome ${model.user},${model.pass} ,${model.f_name},${model.l_name},${model.iot}');

          showwre(context, 'True', 'sign in again $user');
        }
      } else {
        showwre(context, 'Try again', 'Something not correct!!');
      }
    });
  }
  Future<dynamic> showwre(BuildContext context, String first, String last) {
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
