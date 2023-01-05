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
  String birthday = '';
  String hight = '';
  String weight = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Form(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            //Image.asset('assets/doctor.png'),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'กรอกข้อมูลส่วนตัว',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                  'โปรดป้อนข้อมูลที่ถูกต้องเพื่อรับการวิเคราะห์ข้อมูลสุขภาพของคุณอย่างถูกต้อง'),
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
                    onChanged: (value) => user = value.trim(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: InputBorder.none,
                        hintText: 'อีเมลล์'),
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
                        hintText: 'รหัสผ่าน'),
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
                        hintText: 'ชื่อ'),
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
                    onChanged: (value) => birthday = value.trim(),
                    //obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: 'วันเกิด'),
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
                    onChanged: (value) => hight = value.trim(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.height),
                        border: InputBorder.none,
                        hintText: 'ส่วนสูง'),
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
                    onChanged: (value) => weight = value.trim(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.monitor_weight),
                        border: InputBorder.none,
                        hintText: 'น้ำหนัก'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: 350.0,
              height: 40,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent, // background
                    onPrimary: Colors.yellow, // foreground
                  ),
                  onPressed: () {
                    print('user= $user,password = $passd');
                    if (user == '' || passd == '' || hight == '') {
                      showwre(context, 'Error!!',
                          'Type your email and password again!!');
                    } else {
                      check_register();
                      print('testregister $user $hight');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return login();
                      }));
                    }
                  },
                  child: Text(
                    'เสร็จสิ้น',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("มีบัญชีอยู่แล้ว",
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
                      "เข้าสู่ระบบ?",
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
        'http://localhost/watch/insertData.php?user=$user&pass=$passd&f_name=$f_name&l_name=$birthday&iot=$hight';
    await Dio().get(path).then((value) {
      print('### value= $value ####');
      if (value.toString() != 'null') {
        var result = json.decode(value.data);
        print('### result = $result ###');

        for (var item in result) {
          User_register model = User_register.fromMap(item);
          //print(
          //  'Welcome ${model.user},${model.passd} ,${model.f_name},${model.l_name},${model.iot}');

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
