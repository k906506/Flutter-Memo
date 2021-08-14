import 'package:flutter/material.dart';
import '/widgets/app_drawer.dart';

class TrashScreen extends StatelessWidget {
  static const routeName = '/trash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("휴지통"),
      ),
      body: Center(
        child: Text("휴지통"),
      ),
      drawer: AppDrawer(),
    );
  }
}
