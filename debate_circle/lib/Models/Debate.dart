import 'package:debate_circle/Models/Category.dart';

class Debate {
  String id;
  String title;
  List<Category> categories;
  DateTime createdDate;
  DateTime expiryDate;
  User publishedBy;
  User acceptedBy;
  List<Message> messages;

  Debate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    categories = (json['categories'] as List<dynamic>).map(($0) => Category.fromId($0)).toList();
    createdDate = DateTime.fromMillisecondsSinceEpoch(json['createdDate']['_seconds'] * 1000);
    expiryDate = json['expiryDate'] == null ? null : DateTime.fromMillisecondsSinceEpoch(json['expiryDate']['_seconds'] * 1000);
    publishedBy = User.fromJson(json['publishedBy']);
    acceptedBy = json['acceptedBy'] == null ? null : User.fromJson(json['acceptedBy']);
    messages = json['messages'] == null ? [] : (json['messages'] as List<dynamic>).map(($0) => Message.fromJson($0)).toList();
  }
}

class User {
  String userId;
  String username;
  String imageUrl;

  User.fromJson(Map<String, dynamic> json)
    : userId = json['userId'],
      username = json['usernsme'],
      imageUrl = json['image'];
}

class Message {
  String userId;
  DateTime createdDate;
  String content;

  Message.fromJson(Map<String, dynamic> json)
    : userId = json['userId'],
      createdDate = json['createdDate'],
      content = json['content'];
}