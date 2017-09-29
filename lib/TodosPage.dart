import 'dart:async';
import 'package:cobaios/Planets/GradientAppbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cobaios/TodoItemWidget.dart';
import 'package:cobaios/models.dart';
import 'package:flutter/material.dart';

/// To Do Page -> Target Page
class TodosPage extends StatefulWidget {
  @override
  _TodosPageState createState() => new _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  List data;

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Movie Release"),
                  new Expanded(
          child: new RefreshIndicator(
            backgroundColor: Colors.white,
              child: new ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: _itemBuilder),
              onRefresh: _onRefresh),
        ),
        ],
      ),
    );
//    return new Column(
//      children: <Widget>[
//        new GradientAppBar("asd"),
//        new Expanded(
//          child: new RefreshIndicator(
//            backgroundColor: Colors.white,
//              child: new ListView.builder(
//                  itemCount: data == null ? 0 : data.length,
//                  itemBuilder: _itemBuilder),
//              onRefresh: _onRefresh),
//        ),
//      ],
//    );
  }

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://api.themoviedb.org/3/discover/movie?api_key=9548fa0910e2897f79dfdc19e0b2e9a0"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      Map maping = JSON.decode(response.body);
      data = maping["results"];
    });

    return "Success!";
  }

  Future<Null> _onRefresh() {
    Completer<Null> complater = new Completer<Null>();
    Timer timer = new Timer(new Duration(seconds: 3), () {
      complater.complete();
    });
    return complater.future;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Todo todo = getTodo(index);
    return new TodoItemWidget(todo: todo);
  }

  Todo getTodo(int index) {
    return new Todo(
        false,
        1,
        data[index]["title"],
        data[index]["overview"],
        data[index]["vote_average"].toString(),
        data[index]["release_date"],
        data[index]["poster_path"],
        data[index]["backdrop_path"],
        data[index]["popularity"].toString());

    //return new Todo(false ,(data[index]["id"] + data[index]["userId"]) * (data[index]["id"] - data[index]["userId"]) , data[index]["title"], data[index]["body"]);
    //return new Todo(false, "todo $index");
  }
}
