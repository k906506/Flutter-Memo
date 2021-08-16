import 'package:flutter/material.dart';
import 'package:fluttermemo/widgets/deleted_memo_item.dart';
import '/providers/memo_provider.dart';
import 'package:provider/provider.dart';
import '/widgets/memo_item.dart';
import '/widgets/app_drawer.dart';

class TrashScreen extends StatelessWidget {
  static const routeName = '/trash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("휴지통"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          itemBuilder: (context, index) {
            return DeletedMemoItem(
              Provider.of<MemoProvider>(context).deletedItems[index].id,
              Provider.of<MemoProvider>(context).deletedItems[index].title,
              Provider.of<MemoProvider>(context).deletedItems[index].content,
              Provider.of<MemoProvider>(context).deletedItems[index].uploadDate,
            );
          },
          itemCount: Provider.of<MemoProvider>(context).deletedItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
