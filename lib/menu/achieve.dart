import 'package:flutter/material.dart';
import 'package:kidmath/helper_database/database_helper.dart';
import 'package:kidmath/model/score.dart';
import 'package:kidmath/unity/search_data.dart';

class Achieve extends StatefulWidget {
  const Achieve({super.key});

  @override
  State<Achieve> createState() => _ScoreState();
}

class _ScoreState extends State<Achieve> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Score> b = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Achievements'),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearch(b));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Score>>(
          future: databaseHelper.getAllData(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              b= snapshot.data!;
             return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.green,
                                child: Text(
                                  snapshot.data![index].name!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            title: Text(snapshot.data![index].category!),
                            subtitle: Text(
                              '${snapshot.data![index].correctMark!.toString()} Marks',
                            ),
                            trailing: Text(
                                '${snapshot.data![index].article!.toString()} Articles'),
                          ),
                        ));
            }
                 
          }),
    );
  }
}
