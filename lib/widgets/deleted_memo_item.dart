import 'package:flutter/material.dart';
import 'package:fluttermemo/screens/deleted_memo_screen.dart';
import '/providers/memo_provider.dart';
import 'package:provider/provider.dart';
import '/models/memo.dart';
import '/screens/add_memo_screen.dart';
import 'package:intl/intl.dart';

class DeletedMemoItem extends StatelessWidget {
  String id;
  String title;
  String content;
  DateTime uploadDate;

  DeletedMemoItem(this.id, this.title, this.content, this.uploadDate);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          DeletedMemoScreen.routeName,
          arguments: Memo(id, title, content, uploadDate),
        );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("복구"),
              content: Text("메모를 복구하시겠습니까?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("예"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text("아니오"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(title),
            Text(
              DateFormat('MM월 dd일\nkk시 mm분').format(uploadDate),
            ),
          ],
        ),
      ),
    );
  }
}
