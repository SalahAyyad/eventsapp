import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/core/models/event_modle.dart';

class FirebaseUlts {
  static CollectionReference<EventModel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromFireStore(snapshot.data()!),
          toFirestore: (event, _) => event.toFirestore(),
        );
  }

  static Future<void> addEventToFirebase(EventModel event) {
    var collectionRef = getEventCollection();
    var docRef = collectionRef.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }

  static Future<void> favoriteEvent(EventModel event) async {
    var collectionRef = getEventCollection();
    var docRef = collectionRef.doc(event.id);
    await docRef.update({'isFavorite': !event.isFavorite});
  }

  static Future<void> deleteEvent(EventModel event) async {
    var collectionRef = getEventCollection();
    var docRef = collectionRef.doc(event.id);
    await docRef.delete();
  }
}
