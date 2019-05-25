import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();

}

class HomePageState extends State<HomePage> {

  final String url="https://firebasestorage.googleapis.com/v0/b/clientapp-4abbe.appspot.com/o/qrjson.json?alt=media&token=d7159365-f447-4239-9e9f-96a11c15a230";
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

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("List of Participant"),
          elevation: 1.0,

        ),
        body: new ListView.builder(
          padding: EdgeInsets.only(top: 20.0),
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                  child: new Center(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Card(
                            shape: StadiumBorder(side: BorderSide(width: 1.0)),
                            child: Container(
                              child: new Text(
                                  data[index]['name'],
                              ),
                              padding: const EdgeInsets.all(20),
                            ),
                          ),
                          
                          new Padding(
                              padding: EdgeInsets.all(5.0))
                        ],
                      )));
            }));
  }
}