import 'package:flutter/material.dart';
import '/widgets/memo_item.dart';
import 'providers/memo_provider.dart';
import '/screens/trash_screen.dart';
import '/screens/user_info_screen.dart';
import '/widgets/app_drawer.dart';
import '/screens/add_memo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MemoProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Memo App",
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.greenAccent,
          fontFamily: 'baemin',
        ),
        home: MyHomePage(),
        initialRoute: '/',
        routes: {
          UserInfoScreen.routeName: (ctx) => UserInfoScreen(),
          TrashScreen.routeName: (ctx) => TrashScreen(),
          AddMemoScreen.routeName: (ctx) => AddMemoScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        child: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.builder(
            itemBuilder: (context, index) {
              return MemoItem(
                Provider.of<MemoProvider>(context).items[index].id,
                Provider.of<MemoProvider>(context).items[index].title,
                Provider.of<MemoProvider>(context).items[index].content,
                Provider.of<MemoProvider>(context).items[index].uploadDate,
              );
            },
            itemCount: Provider.of<MemoProvider>(context).items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
          ),
        ),
      ),
    );
  }
}
