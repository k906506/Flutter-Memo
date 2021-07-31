import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/screens/add_memo_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Memo App",
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        fontFamily: 'baemin',
      ),
      home: MyHomePage(),
      routes: {
        AddMemoScreen.routeName: (ctx) => AddMemoScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("메모장"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddMemoScreen.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Text("메인"),
      ),
    );
  }
}
