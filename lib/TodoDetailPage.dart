import 'package:cobaios/models.dart';
import 'package:flutter/material.dart';

const Color CustomGreen = const Color(0xF200988a);

class TodoDetailPage extends StatefulWidget {
  TodoDetailPage({Key key, this.todo}) : super(key: key);
  final Todo todo;

  @override
  _ToDoPageState createState() => new _ToDoPageState();
}

class _ToDoPageState extends State<TodoDetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget _CoverImg = new Column(
      children: <Widget>[
        new Container(
            child: new Image.network(
          "https://image.tmdb.org/t/p/w500/" + widget.todo.poster,
          height: 205.0,
        )),
      ],
    );
    Widget _PosterImg = new Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: new Image.network(
        "https://image.tmdb.org/t/p/w500/" + widget.todo.image,
        width: 100.0,
      ),
    );

    Widget _TitleLb = new Container(
      child: new Text(widget.todo.title.toUpperCase(),
          maxLines: 2,
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
    );
    Widget _DateLb = new Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: new Text("(" + widget.todo.date + ")"),
    );
    Widget _ReleaseLb = new Container(
      child: new Text("Release",
          maxLines: 3, style: Theme.of(context).textTheme.subhead),
    );
    Widget _PopularView = new Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: new Row(
          children: <Widget>[
            new Icon(Icons.rate_review, color: CustomGreen, size: 20.0),
            new Container(
              margin: const EdgeInsets.only(left: 3.0),
              child: new Text(widget.todo.popular.toString() + " Review"),
            ),
          ],
        ));
    Widget _RatingVw = new Container(
        child: new Row(
      children: <Widget>[
        new Icon(Icons.star, color: CustomGreen, size: 22.0),
        new Container(
          margin: const EdgeInsets.only(left: 3.0, top: 3.0),
          child: new Text("Rating " + widget.todo.rating.toString()),
        )
      ],
    ));
    Widget _DescriptText = new Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: new Text("Descriptions : ",
          style: new TextStyle(fontWeight: FontWeight.bold)),
    );
    Widget _DescriptLb = new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Text(
          widget.todo.body +
              "\n\n" +
              widget.todo.body +
              "\n\n" +
              widget.todo.body +
              "\n\n" +
              widget.todo.body,
          textAlign: TextAlign.justify),
    );

    var _children = <Widget>[
      _CoverImg,
      new SizedBox(
        child: new Card(
          child: new Container(
            margin: const EdgeInsets.all(10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _PosterImg,
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _TitleLb,
                          _DateLb,
                          _ReleaseLb,
                          _PopularView,
                          _RatingVw,
                        ],
                      ),
                    ),
                  ],
                ),
                _DescriptText,
                _DescriptLb,
              ],
            ),
          ),
        ),
      ),
    ];
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.todo.title)),
      body: new SingleChildScrollView(
        child: new Container(
            child: new Column(
            children: _children,
        )),
      ),
    );
  }
}
