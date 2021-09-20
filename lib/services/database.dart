import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  //creates a collection if not present, else makes the collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
}
