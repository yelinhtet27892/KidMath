import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kidmath/helper_database/database_helper.dart';
import 'package:kidmath/menu/home.dart';
import 'package:kidmath/model/score.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SmallToBig extends StatefulWidget {
  const SmallToBig({super.key});

  @override
  State<SmallToBig> createState() => _BigToSmallState();
}

class _BigToSmallState extends State<SmallToBig> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  late int randomNumber1;
  late int randomNumber2;
  late int randomNumber3;
  late int randomNumber4;
  late SharedPreferences sharedPreferences;
  String category = "Ascending Order";
  int index = 0;
  List<int> InputNumber = [];
  List<int> CorrectNumber = [];

  int correctMark = 0;
  int donesum = 0;
  bool isButton1Pressed = false;
  bool isButton2Pressed = false;
  bool isButton3Pressed = false;
  bool isButton4Pressed = false;


  void Number(int number) {
    setState(() {
      InputNumber.add(number);
      CorrectNumber.add(number);
      CorrectNumber.sort();

      if (InputNumber.length == 4) {
        donesum += 1;

        if (CorrectNumber[index] == InputNumber[index]) {
          correctMark += 1;
          index++;
        }
        randomNumber1 = Random().nextInt(1000);
        randomNumber2 = Random().nextInt(1000);
        randomNumber3 = Random().nextInt(1000);
        randomNumber4 = Random().nextInt(1000);

        InputNumber.clear();
        CorrectNumber.clear();
         isButton1Pressed = false;
        isButton2Pressed = false;
        isButton3Pressed = false;
        isButton4Pressed = false;
      }
    });
  }

  double percentage(int num1, int num2) {
    double p = num1 / num2 * 100;
    p = 0;
    return p;
  }

  @override
  void initState() {
    randomNumber1 = Random().nextInt(1000);
    randomNumber2 = Random().nextInt(1000);
    randomNumber3 = Random().nextInt(1000);
    randomNumber4 = Random().nextInt(1000);

    init();
  }

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
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
                  'ငယ်စဉ်ကြီးလိုက် စီပါ',
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
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                          onPressed: isButton1Pressed ? null : () {
                         setState(() {
                          isButton1Pressed = true;
                        Number(randomNumber1); 
                      });
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isButton1Pressed ? Colors.grey : Colors.white,
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          )),
                          child: Text(
                            '$randomNumber1',
                            style: TextStyle(fontSize: 15, color:isButton1Pressed?Colors.white: Colors.black),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                          onPressed: isButton2Pressed ? null : () {
                         setState(() {
                        isButton2Pressed = true;
                        Number(randomNumber2); 
                      });
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isButton2Pressed ? Colors.grey : Colors.white,
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          )),
                          child: Text(
                            '$randomNumber2',
                            style: TextStyle(fontSize: 15, color: isButton2Pressed?Colors.white: Colors.black),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                          onPressed: isButton3Pressed ? null : () {
                         setState(() {
                         isButton3Pressed = true;
                        Number(randomNumber3);
                        
                        
                      });
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isButton3Pressed ? Colors.grey : Colors.white,
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          )),
                          child: Text(
                            '$randomNumber3',
                            style: TextStyle(fontSize: 15,color:isButton3Pressed?Colors.white: Colors.black),
                          )),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                     SizedBox(
                      height: 60,
                      width: 60,
                      child: ElevatedButton(
                          onPressed: isButton4Pressed ? null : () {
                         setState(() {
                        
                        isButton4Pressed = true;
                        Number(randomNumber4);
                        
                      });
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isButton4Pressed ? Colors.grey : Colors.white,
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          )),
                          child: Text(
                            '$randomNumber4',
                            style: TextStyle(fontSize: 15, color:isButton4Pressed?Colors.white: Colors.black),
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
                                      Score score =
                                          Score.withoutId(correctMark, donesum,category,sharedPreferences.getString('data1'));
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
