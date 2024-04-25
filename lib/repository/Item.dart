import 'dart:ui';

class Item {
  final String id;

  final String title;
  final String content;
  final VoidCallback onPressed;
  final DateTime createdAt;

  const Item(
      {required this.id,
      required this.title,
      required this.content,
      required this.onPressed,
      required this.createdAt});

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toString(),
    };
  }

  @override
  String toString() {
    return 'Item{id: $id, title: $title, content: $content, createdAt: $createdAt}';
  }
}
