import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/message.dart';

class MessageDao {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('message');

  void saveMessage(Message message) {
    collection.add(message.toJson());
  }

  Stream<QuerySnapshot> getMessageStream() {
    return collection.orderBy('date', descending: true).snapshots();
  }
}
