import 'package:flutter/material.dart';
import 'package:fluttermemo/models/memo.dart';

class MemoProvider with ChangeNotifier {
  List<Memo> memos = [];
  List<Memo> deletedMemos = [];
  String token;

  MemoProvider(this.token, this.memos, this.deletedMemos);

  List<Memo> get items {
    return [...memos];
  }

  List<Memo> get deletedItems {
    return [...deletedMemos];
  }

  // Future<void> fetchAndSetMemo() {
  // }

  // 메모 리스트에 추가하는 메소드
  Future<void> addMemo(String id, String title, String content) async {
    if (id == "") {
      memos.add(
        new Memo(
          DateTime.now().toString(),
          title,
          content,
          DateTime.now(),
        ),
      );
    } else {
      var index = memos.indexWhere((element) => element.id == id);
      memos[index] = new Memo(
        id,
        title,
        content,
        DateTime.now(),
      );
    }
    sortItems();
    notifyListeners();
  }

  // 메모를 제거할 때 제거된 메모 리스트에 추가하는 메소드
  Future<void> addDeletedMemo(
      String id, String title, String content, DateTime uploadDate) async {
    deletedMemos.add(
      new Memo(
        id,
        title,
        content,
        uploadDate,
      ),
    );
    notifyListeners();
  }

  // 메모를 제거하는 메소드
  Future<void> deleteMemo(String id) async {
    memos.removeWhere((element) => element.id == id);
    sortItems();
    notifyListeners();
  }

  // 메모 생정(수정) 일자를 기준으로 내림차순으로 정렬하는 메소드
  void sortItems() {
    memos.sort((a, b) => b.uploadDate.compareTo(a.uploadDate));
  }
}
