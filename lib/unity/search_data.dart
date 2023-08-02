import 'package:flutter/material.dart';
import 'package:kidmath/model/score.dart';



class MySearch extends SearchDelegate {
  List<Score> score;
  MySearch(this.score);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Score> result = score
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()) ||
            element.category!.toLowerCase() == query.toLowerCase())
        .toList();
    return Screen(result: result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Score> result = score
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()) ||
            element.category!.toLowerCase() == query.toLowerCase())
        .toList();
    return Screen(result: result);
  }
}

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.result,
  });

  final List<Score> result;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.green,radius: 30,child: Text(result[index].name!),),
            title: Text(result[index].category!),
            subtitle: Text('${result[index].correctMark!} Marks'),
            trailing: Text('${result[index].article!} Articles'),
          ),
        );
      },
    );
  }
}
