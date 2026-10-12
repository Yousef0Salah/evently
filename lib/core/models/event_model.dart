import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class EventModel {
  String id;
  String? userId;
  String categoryId;
  String title;
  String desc;
  String date;
  String time;
  List<String> usersFav;

  EventModel({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.desc,
    required this.date,
    required this.time,
    this.userId,
    this.usersFav = const [],
  });

  Map<String, dynamic> toJson() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    return {
      "id": id,
      "userId": userId,
      "categoryId": categoryId,
      "date": date,
      "time": time,
      "desc": desc,
      "title": title,
      "userFav": usersFav,
    };
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    List fav = json['userFav'] ?? [];
    return EventModel(
      id: json['id'] ?? '',
      categoryId: json['categoryId'] ?? '',
      title: json['title'] ?? '',
      desc: json['desc'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      userId: json['userId'] ?? '',
      usersFav:
          fav.map<String>((e) {
            return e.toString();
          }).toList() 
    );
  }
}
