import 'package:choco_tea/models/tea.dart';
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

  // Tea list from snapshot
  List<Tea> _teaListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Tea(
        name: doc.data['name'] ?? '',
        count: doc.data['count'] ?? 0,
        type: doc.data['type'] ?? 'none'
      );
    }).toList();
  }

  // get teas stream
  Stream<List<Tea>> get teas {
    return teaCollection.snapshots()
    .map(_teaListFromSnapshot);
  }


}
