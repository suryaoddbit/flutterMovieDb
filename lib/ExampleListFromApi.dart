import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
/// Get Data from API and bind to single listview
class HomeFull extends StatefulWidget {
  @override
  _HomeFullState createState() => new _HomeFullState();
}

const jsonCodec = const JsonCodec();

class _HomeFullState extends State<HomeFull> {
//  _getIPAddress() async {
//    String url = 'https://api.themoviedb.org/3/discover/movie?api_key=9548fa0910e2897f79dfdc19e0b2e9a0';
//    var httpClient = createHttpClient();
//    var response = await httpClient.read(url);
//    Map data = JSON.decode(response);
//    List ip = data['results'];
//    print("Ip $ip");
//  }
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://api.themoviedb.org/3/discover/movie?api_key=9548fa0910e2897f79dfdc19e0b2e9a0"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      print("Response : "+response.body);
      Map maping = JSON.decode(response.body);
      print("Map $maping");
      data = maping['results'];
      //print("A $a");
    });
    //print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listviews"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(data[index]["title"]),
          );
        },
      ),
    );
  }
}