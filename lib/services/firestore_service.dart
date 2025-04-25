import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collection = 'events';

  // Add a new event
  Future<void> addEvent(Event event) async {
    try {
      await _firestore.collection(collection).doc(event.id).set(event.toMap());
    } catch (e) {
      print('Error adding event: $e');
      throw e;
    }
  }

  // Get all events
  Stream<List<Event>> getEvents() {
    return _firestore.collection(collection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromMap(doc.data())).toList();
    });
  }

  // Update an event
  Future<void> updateEvent(Event event) async {
    try {
      await _firestore.collection(collection).doc(event.id).update(event.toMap());
    } catch (e) {
      print('Error updating event: $e');
      throw e;
    }
  }

  // Delete an event
  Future<void> deleteEvent(String eventId) async {
    try {
      await _firestore.collection(collection).doc(eventId).delete();
    } catch (e) {
      print('Error deleting event: $e');
      throw e;
    }
  }
}
