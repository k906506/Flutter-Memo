import 'package:flutter/material.dart';
import '/screens/trash_screen.dart';
import '/screens/user_info_screen.dart';
import '/widgets/app_drawer.dart';
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
      initialRoute: '/',
      routes: {
        UserInfoScreen.routeName : (ctx) => UserInfoScreen(),
        TrashScreen.routeName : (ctx) => TrashScreen(),
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
      drawer: AppDrawer(),
      body: Center(
        child: Text("메인"),
      ),
    );
  }
}
