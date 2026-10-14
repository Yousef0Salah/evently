import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbService {
  static var firebase = FirebaseFirestore.instance;

  static Future<void> addEvent(EventModel event) async {
    var doc = await firebase.collection('Events').doc();
    event.id = doc.id;
    doc.set(event.toJson());
  }

  static Future<void> updateEvent(EventModel event) async {
    var doc = await firebase.collection('Events').doc(event.id);
    event.id = doc.id;
    doc.set(event.toJson());
  }

  static Future<void> deleteEvent(String id) async {
    firebase.collection('Events').doc(id).delete();
  }

  static Future<List<EventModel>> getEvent() async {
    List<EventModel> events = [];
    var data = await firebase.collection('Events').get();
    for (var e in data.docs) {
      var event = EventModel.fromJson(e.data());
      events.add(event);
    }
    return events;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getEventStream(String? categoryId)  {

    var data;
    if(categoryId == null){
     data =  firebase
        .collection('Events')
        .snapshots();
    }else{

   data =  firebase
        .collection('Events')
        .where('categoryId', isEqualTo: categoryId)
        .snapshots();
    }

    
    return data;
  }

  static Future<List<EventModel>> getEventFav() async {
    List<EventModel> events = [];
    var userId = FirebaseAuth.instance.currentUser!.uid;

    var data = await firebase
        .collection('Events')
        .where('userFav', arrayContains: userId)
        .get();
    for (var e in data.docs) {
      var event = EventModel.fromJson(e.data());
      events.add(event);
    }
    return events;
  }

  static Future<void> toggleFav(EventModel event) async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    if (event.usersFav.contains(userId)) {
      event.usersFav.remove(userId);
    } else {
      event.usersFav.add(userId);
    }
    await firebase.collection('Events').doc(event.id).update(event.toJson());
  }
}
