import 'package:brue_crew/models/brew.dart';
import 'package:brue_crew/models/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final uid;
  DatabaseService({this.uid});

  final CollectionReference brewCollection = Firestore.instance.collection('brews');


  Future updateUser(String name,String suger,int strength) async
  {

    return await brewCollection.document(uid).setData({
      'name': name ,
      'suger': suger,
      'strength':strength,
  });
    
  }

  List<brew> _brewlistFromSnapshot (QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc) {
      return brew(
        name: doc.data['name'] ?? '',
        suger: doc.data['suger'] ?? '0',
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }

// stream that retur snap shot fromthe database 

/*  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }

*/

// stream that return list of our custom brew
  Stream <List<brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewlistFromSnapshot);
  }

//userdata from snapshot to custom usermodel
  UserData _userdataFromSnapshot (DocumentSnapshot snapshot)
  {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      suger: snapshot.data['suger'],
      strength: snapshot.data['strength'],
    );

  }

// strem that will get user data form cloud database
  
  /*Stream<DocumentSnapshot> get userdata {
    return brewCollection.document(uid).snapshots();


  }
  */

//strem that will get user data and map to custon userdatmode

Stream<UserData> get userdata {
  return brewCollection.document(uid).snapshots()
  .map(_userdataFromSnapshot);
}

}