import 'package:flutter/material.dart';
import '/providers/memo_provider.dart';
import 'package:provider/provider.dart';
import '/models/memo.dart';
import '/screens/add_memo_screen.dart';
import 'package:intl/intl.dart';

class MemoItem extends StatelessWidget {
  String id;
  String title;
  String content;
  DateTime uploadDate;

  MemoItem(this.id, this.title, this.content, this.uploadDate);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AddMemoScreen.routeName,
          arguments: Memo(id, title, content, uploadDate),
        );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("삭제"),
              content: Text("메모를 삭제하시겠습니까?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("예"),
                  onPressed: () {
                    Provider.of<MemoProvider>(context, listen: false)
                        .deleteMemo(id, title, content, uploadDate);
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
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              DateFormat('MM월 dd일\nkk시 mm분').format(uploadDate),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
