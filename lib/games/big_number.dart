
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kidmath/helper_database/database_helper.dart';
import 'package:kidmath/menu/home.dart';
import 'package:kidmath/model/score.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BigNumber extends StatefulWidget {
  @override
  _RandomNumberChooserState createState() => _RandomNumberChooserState();
}

class _RandomNumberChooserState extends State<BigNumber> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  late SharedPreferences sharedPreferences;
  late int randomNumber1;
  late int randomNumber2;
  int correctMark = 0;
  int donesum = 0;
  String category = "Big Number";
 

  void Number1() {
    setState(() {
      donesum += 1;
      if (randomNumber1 > randomNumber2) {
        correctMark += 1;
      }
      randomNumber1 = Random().nextInt(100);
      randomNumber2 = Random().nextInt(100);
    });
  }

  void Number2() {
    setState(() {
      donesum += 1;
      if (randomNumber1 < randomNumber2) {
        correctMark += 1;
      }
      randomNumber1 = Random().nextInt(100);
      randomNumber2 = Random().nextInt(100);
    });
  }

  double percentage(int num1, int num2) {
    double p = num1 / num2 * 100;
    p = 0;
    // int j = p.toInt();

    return p;
  }

  @override
  void initState() {
    randomNumber1 = Random().nextInt(100);
    randomNumber2 = Random().nextInt(100);
    

    init();
  }

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'images/1.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'X',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'ကြီးသောကိန်းကို ရွေးပါ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                    child: Text(
                      'ရမှတ်',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 52),
                    child: Text(
                      'အပုဒ်ရေ',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$correctMark',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "${percentage(correctMark, donesum).toStringAsFixed(1)}%",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    '$donesum',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            Number1();
                            print('$correctMark');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              )),
                          child: Text(
                            '$randomNumber1',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {
                            Number2();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              )),
                          child: Text(
                            '$randomNumber2',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Your Mark is $correctMark'),
                              content: Text(
                                  'Are you going to stop playing the game?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel')),
                                TextButton(
                                    onPressed: () async {
                                      Score score = Score.withoutId(
                                          correctMark,
                                          donesum,
                                          category,
                                          sharedPreferences.getString('data1'));
                                      await databaseHelper.insertData(score);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                    },
                                    child: Text('OK'))
                              ],
                            ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  child: SizedBox(
                      width: 100,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      )))),
            ],
          ),
        ],
      ),
    );
  }
}
