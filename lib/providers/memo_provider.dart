import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/memo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<void> fetchAndSetMemo() async {
    final url =
        'https://fluttermemo-f35db-default-rtdb.firebaseio.com/memos.json?auth=$token';
    final response = await http.get(
      Uri.parse(url),
    );
    final responseData = json.decode(response.body) as Map<String, dynamic>;
    List<Memo> loadedMemos = [];
    List<Memo> loadedDeleteMemos = [];
    print(responseData);
    if (responseData != null) {
      if (responseData['upload'] != null && responseData['delete'] == null) {
        responseData['upload'].forEach(
          (key, value) {
            loadedMemos.add(
              Memo(
                key,
                value['title'],
                value['content'],
                DateTime.parse(value['uploadDate']),
              ),
            );
          },
        );
      } else if (responseData['upload'] == null &&
          responseData['delete'] != null) {
        responseData['delete'].forEach(
          (key, value) {
            loadedDeleteMemos.add(
              Memo(
                key,
                value['title'],
                value['content'],
                DateTime.parse(value['uploadDate']),
              ),
            );
          },
        );
      } else {
        responseData['upload'].forEach(
          (key, value) {
            loadedMemos.add(
              Memo(
                key,
                value['title'],
                value['content'],
                DateTime.parse(value['uploadDate']),
              ),
            );
          },
        );
        responseData['delete'].forEach(
          (key, value) {
            loadedDeleteMemos.add(
              Memo(
                key,
                value['title'],
                value['content'],
                DateTime.parse(value['uploadDate']),
              ),
            );
          },
        );
      }
    }
    memos = loadedMemos;
    deletedMemos = loadedDeleteMemos;
    sortItems();
    notifyListeners();
  }

  // 메모 리스트에 추가하는 메소드
  Future<void> addMemo(String id, String title, String content) async {
    if (id == "") {
      final url =
          'https://fluttermemo-f35db-default-rtdb.firebaseio.com/memos/upload/.json?auth=$token';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'title': title,
            'content': content,
            'uploadDate':
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())
          },
        ),
      );
    } else {
      final url =
          'https://fluttermemo-f35db-default-rtdb.firebaseio.com/memos/upload/$id.json?auth=$token';
      final response = await http.patch(
        Uri.parse(url),
        body: json.encode(
          {
            'title': title,
            'content': content,
            'uploadDate':
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now())
          },
        ),
      );
    }
    fetchAndSetMemo();
  }

  // 메모를 제거하거나 휴지통에 메모를 추가하는 메소드
  Future<void> deleteMemo(String id, String title, String content, DateTime uploadDate) async {
    // 1. delete를 이용하여 Memo List에서 제거
    final deleteUrl = 'https://fluttermemo-f35db-default-rtdb.firebaseio.com/memos/upload/$id.json?auth=$token';
    final deleteResponse = await http.delete(Uri.parse(deleteUrl));
    if (deleteResponse.statusCode >= 400) {
      return;
    }
    // 2. 정상적으로 제거된 경우 Deleted Memo List에 추가
    final uploadUrl =
        'https://fluttermemo-f35db-default-rtdb.firebaseio.com/memos/delete/.json?auth=$token';
    final uploadResponse = await http.post(
      Uri.parse(uploadUrl),
      body: json.encode(
        {
          'title': title,
          'content': content,
          'uploadDate': DateFormat('yyyy-MM-dd kk:mm:ss').format(uploadDate),
        },
      ),
    );
    // 3. Memo, DeletedMemo 갱신
    fetchAndSetMemo();
  }

  // 메모 생정(수정) 일자를 기준으로 내림차순으로 정렬하는 메소드
  void sortItems() {
    memos.sort((a, b) => b.uploadDate.compareTo(a.uploadDate));
    deletedMemos.sort((a, b) => b.uploadDate.compareTo(a.uploadDate));
  }
}
