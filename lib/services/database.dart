import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference teaCollection =  Firestore.instance.collection('teas');

  Future updateUserData(String type, String name, int count) async {
    return await teaCollection.document(uid).setData({
      'type': type,
      'name': name,
      'count': count,
    });
  }

}
