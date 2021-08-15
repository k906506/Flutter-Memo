class Memo {
  String id; // 일종의 Primary key
  String title;
  String content;
  DateTime uploadDate;

  Memo(this.id, this.title, this.content, this.uploadDate);
}