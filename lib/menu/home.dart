import 'package:flutter/material.dart';
import 'package:kidmath/games/big_number.dart';
import 'package:kidmath/games/big_to_small.dart';
import 'package:kidmath/games/small_number.dart';
import 'package:kidmath/games/small_to_big.dart';
import 'package:kidmath/main.dart';
import 'package:kidmath/menu/achieve.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _BodyState();
}

class _BodyState extends State<Home> {
  late SharedPreferences sharedPreferences;
  Future<void>? initialization;

  @override
  void initState() {
    super.initState();
    initialization = init();
  }

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KID MATH'),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            FutureBuilder(
                future: initialization,
                builder: ((context, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                    ? CircularProgressIndicator()
                    : UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        accountName:
                            Text(sharedPreferences.getString('data1') ?? ''),
                        accountEmail:
                            Text(sharedPreferences.getString('data2') ?? ''),
                        currentAccountPicture: Image.asset(
                          'images/3.png',
                          color: Colors.white,
                        ),
                      ))),
            // Padding(
            //   padding:
            //       const EdgeInsets.only(right: 13, top: 8, left: 13, bottom: 8),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Row(
            //       children: [
            //         Card(
            //           elevation: 0,
            //           color: Colors.grey[300],
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10)),
            //           child: Padding(
            //             padding: const EdgeInsets.all(10.0),
            //             child: Icon(
            //               Icons.settings,
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           "Settings",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 13, left: 13, bottom: 8),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Row(
            //       children: [
            //         Card(
            //             color: Colors.grey[300],
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10)),
            //             elevation: 0,
            //             child: Padding(
            //               padding: const EdgeInsets.all(10.0),
            //               child: Icon(Icons.feed),
            //             )),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           "Feedback",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 13, left: 13, bottom: 8),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Row(
            //       children: [
            //         Card(
            //             color: Colors.grey[300],
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(10)),
            //             elevation: 0,
            //             child: Padding(
            //               padding: const EdgeInsets.all(10.0),
            //               child: Icon(Icons.question_answer),
            //             )),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           "About Us",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 13, left: 13, bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Card(
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.archive),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (bc) => Achieve()));
                      },
                      child: Text(
                        "Achivements",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title:
                                  Text('Are you sure you want to exit Account'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Body()));
                                    },
                                    child: Text('OK'))
                              ],
                            ));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  child: Text(
                    "LOGOUT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/2.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BigNumber()));
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 50,
                          shadowColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )),
                      child: Text(
                        'ကြီးသောကိန်း',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmallNumber()));

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 50,
                          shadowColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )),
                      child: Text(
                        'ငယ်သောကိန်း',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BigToSmall()));

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 50,
                          shadowColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )),
                      child: Text(
                        'ကြီးစဉ်ငယ်လိုက်',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 180,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SmallToBig()));

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 50,
                          shadowColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )),
                      child: Text(
                        'ငယ်စဉ်ကြီးလိုက်',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

