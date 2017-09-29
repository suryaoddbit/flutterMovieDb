import 'package:cobaios/Planets/GradientAppbar.dart';
import 'package:cobaios/Planets/HomePageBody.dart';
import 'package:flutter/material.dart';

class HomePageGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            new GradientAppBar("Trevo"),
            new Expanded(
              child: new SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    new HomePageBody(),
                    new HomePageBody(),
                    new HomePageBody(),
                    new HomePageBody(),
                    new HomePageBody(),
                    new HomePageBody(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
