import 'package:flutter/material.dart';
import 'package:kidmath/menu/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Body(),
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
    );
  }
}

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller12 = TextEditingController();
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Container(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Kid Math Game",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Form(
                        child: Column(
                          children: [
                            Material(
                              elevation: 20,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                controller: controller1,
                                key: Key('1'), // Add a key here
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter Name",
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(color: Colors.black),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.green,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Material(
                              elevation: 20,
                              shadowColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextFormField(
                                controller: controller12,
                                key: Key('2'), // Add a key here
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(color: Colors.black),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.green,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: 400,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_validateForm()) {
                              await sharedPreferences.setString(
                                'data1',
                                controller1.text,
                              );
                              await sharedPreferences.setString(
                                'data2',
                                controller12.text,
                              );
                              print("Data saved successfully.");
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (bc) => Home()),
                              );
                            } else {
                              print('Form not valid');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 20,
                            shadowColor: Colors.white,
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text("LOGIN"),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Text(
                      //     "Create New Account",
                      //     style: TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.blue,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _validateForm() {
    return _validateField(controller1) && _validateField(controller12);
  }

  bool _validateField(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return false;
    }
    return true;
  }
}
