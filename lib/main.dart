import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white),
  );
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  var data = List<dynamic>(); //// data dinamik liste

  Future<String> getData() async {
    var respos = await http.get("https://jsonplaceholder.typicode.com/posts");
    setState(() {
      data = json.decode(respos.body);
    });
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "json Example",style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
           // color: Colors.white70,
            
          

            child: Padding(
              padding: EdgeInsets.all(25),
            child: Text(data[index]["title"], style: TextStyle(fontSize: 18,
            color: Colors.black
            ),
            ),

            ),
           
          );
        },
      ),
      
    );
  }
}
