import 'package:cobaios/TodoDetailPage.dart';
import 'package:cobaios/models.dart';
import 'package:flutter/material.dart';

class TodoItemWidget extends StatefulWidget {
  TodoItemWidget({Key key, this.todo}) : super(key: key);
  final Todo todo;

  @override
  _TodoItemWidgetState createState() => new _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    /*
    return new GestureDetector(
      onTap: _onTap,
      child: new SizedBox(
        height: 180.0,
        child: new Card(
          child: new Container(
            margin: const EdgeInsets.all(5.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: new Image.network(
                    "https://image.tmdb.org/t/p/w500/" + widget.todo.image,
                  ),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      width: 200.0,
                      child: new Text(widget.todo.title.toUpperCase(),
                          maxLines: 1,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                    ),
                    new Container(
                      width: 200.0,
                      margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                      child: new Text("(" + widget.todo.date + ")"),
                    ),
                    new Container(
                      width: 230.0,
                      child: new Text(widget.todo.body,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.subhead),
                    ),
                    new Container(
                        width: 200.0,
                        margin: const EdgeInsets.only(top: 15.0),
                        child: new Row(
                          children: <Widget>[
                            new Icon(Icons.star, color: Colors.yellow[700], size: 22.0),
                            new Container(margin: const EdgeInsets.only(left: 3.0),
                              child: new Text("Rating " + widget.todo.rating.toString()),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );*/
    Widget _PosterImg = new Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: new Image.network(
        "https://image.tmdb.org/t/p/w500/" + widget.todo.image,
        scale: 5.0,
        width: 100.0,
      ),
    );

    Widget _TitleLb = new Container(
      child: new Text(widget.todo.title.toUpperCase(),
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
    );

    Widget _DateLb = new Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: new Text("(" + widget.todo.date + ")", style: Theme.of(context).textTheme.subhead),
    );
    Widget _DescripLb = new Container(
      child: new Text(widget.todo.body,
           textAlign: TextAlign.justify,
           //style: Theme.of(context).textTheme.subhead
      ),
    );
    Widget _RatingView = new Container(
      margin: const EdgeInsets.only(top: 15.0, bottom: 5.0),
      child: new Row(
        children: <Widget>[
          new Icon(Icons.star, color: Colors.yellow[700], size: 22.0),
          new Container(
            margin: const EdgeInsets.only(left: 3.0),
            child: new Text("Rating " + widget.todo.rating.toString()),
          )
        ],
      ),
    );

    return new GestureDetector(
      onTap: _onTap,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
          new Card(
            child: new Container(
              margin: const EdgeInsets.all(5.0),
              child: new GestureDetector(
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _PosterImg,
                    new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[_TitleLb, _DateLb, _DescripLb, _RatingView],
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
            planetThumbnail,
          ],
        ),
      ),
    );
  }

  void _onTap() {
    Route route = new MaterialPageRoute(
      settings: new RouteSettings(name: "/todos/todo"),
      builder: (BuildContext context) => new TodoDetailPage(todo: widget.todo),
    );
    Navigator.of(context).push(route);
  }

  final planetThumbnail = new Container(
    margin: new EdgeInsets.symmetric(vertical: 16.0),
    alignment: FractionalOffset.centerLeft,
    child: new Image(
      image: new AssetImage("images/mars.png"),
      height: 92.0,
      width: 92.0,
    ),
  );

  final planetCard = new Container(
    height: 124.0,
    margin: new EdgeInsets.only(left: 46.0),
    decoration: new BoxDecoration(
      color: new Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(8.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );


}
