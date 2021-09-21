import 'package:brew_crew/models/brew.dart';
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

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
          name: doc.get('name') ?? ' ',
          sugar: doc.get('sugar') ?? '0',
          strength: doc.get('strength') ?? 0);
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
