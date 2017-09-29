import 'package:cobaios/ExampleListFromApi.dart';
import 'package:cobaios/Planets/HomePage.dart';
import 'package:cobaios/TodosPage.dart';
import 'package:flutter/material.dart';
import 'theme.dart' as Theme;

void main() {
  //runApp(new MyApp());
  runApp(new MaterialApp(
    home: new TodosPage(),
  ));
  //runApp(new MyApp());
}

final ThemeData themeData = new ThemeData(
  primaryColor: Colors.blue,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var _routes = <String, WidgetBuilder>{
       "/todos" : (BuildContext context) => new TodosPage(),
    };
    return new MaterialApp(
      title: "Navigation Page",
      theme: Theme.CompanyThemeData,
      home: new HomePage(),
      routes: _routes,
    );
  }
}

/// Home Page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("My Appbar")),
      body: new RaisedButton(child: new Text("My To Do"), onPressed: onPress),
    );
  }

  void onPress() {
    Navigator.of(context).pushNamed("/todos");
  }
}










