import 'package:flutter/material.dart';
import '/screens/trash_screen.dart';
import '/screens/user_info_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              leading: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Column(
                          children: <Widget>[
                            FlatButton(
                              child: Text("회원정보 수정"),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(UserInfoScreen.routeName);
                              },
                            ),
                            FlatButton(
                              child: Text("로그아웃"),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {
                                Navigator.popUntil(
                                  context,
                                  ModalRoute.withName('/'),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              title: Text("고도현님"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("메모"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("휴지통"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(TrashScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
