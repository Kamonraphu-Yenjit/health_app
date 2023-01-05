import 'package:flutter/material.dart';
import 'package:testt/user_model.dart';
import 'package:testt/navbar.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Myservice extends StatefulWidget {
  //const show_screen({super.key});
  // final UserModel userModel;
  //Myservice({required this.userModel});

  @override
  State<Myservice> createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  // late UserModel model_scree_play;
  @override
  //void initState() {
  // TODO: implement initState
  // super.initState();
  // model_scree_play = widget.userModel;
  // }
  String tdatawake = DateFormat("HH:mm:ss").format(DateTime.now());
  String tdatasleep = DateFormat("HH:mm:ss").format(DateTime.now());
  static String timetosleep = "";
  static String timetowakeup = "";
  void timesleep() {
    setState(() {
      timetosleep = tdatasleep;
    });
  }

  void timewakes() {
    setState(() {
      timetowakeup = tdatawake;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        //leading: Icon(Icons.menu),
        title: Row(
          children: [
            //   Text(
            //   '${model_scree_play.f_name} ',
            //   style: TextStyle(
            //       color: Colors.black,
            //      fontSize: 20,
            //     fontWeight: FontWeight.bold),
            // ),
            Text(
              'Health',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Icon(Icons.light_sharp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: new Icon(Icons.person),
              highlightColor: Colors.pink,
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) {
                // return show_person(
                //  userModel: model_scree_play,
                //);
                //  }));
              },
            ),
          ),
          IconButton(
            icon: new Icon(Icons.menu),
            highlightColor: Colors.pink,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NavBar()));
            },
          ),
        ],
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('ก้าว',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2),
                                        shape: BoxShape.circle,
                                        // You can use like this way or like the below line
                                        //borderRadius: new BorderRadius.circular(30.0),
                                        color: Colors.orangeAccent,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.directions_walk),
                                          Text('0'),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Step distance :',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(' 0.00 ',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(' km ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Row(
                                              children: [
                                                Text('Step consumption :',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(' 0 ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(' kcal ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('อัตราการเต้นของหัวใจ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.heart_broken_rounded,
                                      color: Colors.pink,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('90',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Text('BPM',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 8,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('น้ำหนัก',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('104.5',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text(' กก.',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text('ส่วนสูง',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('176.5',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text(' ซม.',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4,
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text('เวลาการเข้านอน',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Icon(
                                      Icons.bed_rounded,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 40.0),
                                      child: Column(
                                        children: [
                                          Text('บันทึกการเข้านอน'),
                                          ElevatedButton(
                                              onPressed: () => {timesleep()},
                                              child: Text('บันทึก')),
                                          Row(
                                            children: [
                                              Text('เวลาเข้านอน => '),
                                              Text('$timetosleep'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text('บันทึกการตื่นนอน'),
                                        ElevatedButton(
                                            onPressed: () => {timewakes()},
                                            child: Text('บันทึก')),
                                        Row(
                                          children: [
                                            Text('เวลาตื่นนอน => '),
                                            Text('$timetowakeup'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
