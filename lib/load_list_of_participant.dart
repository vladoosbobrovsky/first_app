import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();

}

class HomePageState extends State<HomePage> {

  final String url="https://firebasestorage.googleapis.com/v0/b/clientapp-4abbe.appspot.com/o/qrjson.json?alt=media&token=40ece7c2-8dbe-4ed8-8332-780ef56de2b5";
  List data;

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async{
    var response = await http.get(
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"}

    );

    print(response.body);

    setState(() {
      var toJsonData = json.decode(response.body);
      data = toJsonData['results'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("List of Participant"),
        ),

        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  child: new Center(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Card(
                              child: new Container(
                                child: new Text(data[index]['name']),
                                padding: const EdgeInsets.all(20),
                              ))
                        ],
                      )));
            }));
  }
}