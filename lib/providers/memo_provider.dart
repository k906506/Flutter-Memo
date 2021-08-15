import 'package:flutter/material.dart';
import 'package:fluttermemo/models/memo.dart';

class MemoProvider with ChangeNotifier {
  List<Memo> memos = [];

  List<Memo> get items {
    return [...memos];
  }

  // Future<void> fetchAndSetMemo() {
  // }

  Future<void> addMemo(String title, String content) async {
    memos.add(new Memo(DateTime.now().toString(), title, content, DateTime.now()));
    sortItems();
    notifyListeners();
  }

  Future<void> deleteMemo(String id) async {
    memos.removeWhere((element) => element.id == id);
    sortItems();
    notifyListeners();
  }

  Future<void> updateMemo(String id, String title, String content) async {
    var index = memos.indexWhere((element) => element.id == id);
    memos[index] = new Memo(id, title, content, DateTime.now());
    sortItems();
    notifyListeners();
  }

  void sortItems() {
    memos.sort((a, b) => b.uploadDate.compareTo(a.uploadDate));
  }
}