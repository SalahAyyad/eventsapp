import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/core/models/event_modle.dart';
import 'package:ecom/core/utlis/firebase_ults.dart';
import 'package:flutter/material.dart';

class GetEventsProvider extends ChangeNotifier {
  List allEvents = [];
  List<EventModel> filteredEvents = [];
  String currentFilter = 'All';

  void getevents() async {
    QuerySnapshot<EventModel> query =
        await FirebaseUlts.getEventCollection().get();
    allEvents = query.docs.map((doc) {
      return doc.data();
    }).toList();
    filteredEvents = List.from(allEvents);
    notifyListeners();
  }

  void getFliterEvents(String fliterEvent) async {
    Query<EventModel> query = FirebaseUlts.getEventCollection();
    if (fliterEvent != "All") {
      query = query.where('category', isEqualTo: fliterEvent);
    }
    var events = await query.get();
    filteredEvents = events.docs.map((doc) {
      return doc.data();
    }).toList();
    notifyListeners();
  }

  Future<void> deleteEvent(EventModel event) async {
    await FirebaseUlts.deleteEvent(event);
    allEvents.removeWhere((event) => event.id == event.id);
    filteredEvents.removeWhere((event) => event.id == event.id);
    getFliterEvents(currentFilter);
    notifyListeners();
  }

  void favEvent(EventModel event) async {
    await FirebaseUlts.favoriteEvent(event);
    event.isFavorite = !event.isFavorite;
    notifyListeners();
  }
}
