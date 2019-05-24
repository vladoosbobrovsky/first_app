import 'package:first_app/load_list_of_participant.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {

  static const String _title = 'ClientApp';
  Color gradientStart = Colors.deepPurple[700]; //Change start gradient color here
  Color gradientEnd = Colors.purple[500]; //Change end gradient color here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: MyStatelessWidget(),

        backgroundColor:Color(0)

      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(height: 150),
          new InkWell(
            //onTap: () =>
            child: new Container(
              //width: 100.0,
              height: 50.0,
              width: 250.0,
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
                color: Colors.blueAccent,
                border: new Border.all(color: Colors.white, width: 3.0),
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: new Center(child: new Text('Create an Event',
                style: new TextStyle(fontSize: 24.0, color: Colors.white),),),
            ),
          ),
          new Padding(padding: EdgeInsets.all(25.0)),

          new InkWell(
            onTap: () =>
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),),
            child: new Container(
              //width: 100.0,
              height: 50.0,
              width: 250.0,
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
                color: Colors.blueAccent,
                border: new Border.all(color: Colors.white, width: 3.0),
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: new Center(child: new Text('Load list of Participants',
                style: new TextStyle(fontSize: 20.0, color: Colors.white),),),
            ),
          ),
        ],
      ),
    );
  }
}