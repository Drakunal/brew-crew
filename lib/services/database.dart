import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  //creates a collection if not present, else makes the collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  //link is made with the collection named brews

  Future updateUserData(String sugar, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugar': sugar, 'name': name, 'strength': strength});
  }

  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
