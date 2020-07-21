import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_blood/model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  final String uid;
  DatabaseService({this.uid});

  Future updateUserData(Map<String, dynamic> dataMap) async {
    // - Statically adding data in the db
    await userCollection.document(uid).setData(
      {
        'userID': uid,
      },
      merge: true,
    );
    // - Dynamically adding data in the db
    dataMap.forEach(
      (key, value) async {
        await userCollection.document(uid).setData(
          {
            key: value,
          },
          merge: true,
        );
      },
    );
  }

  Future updateUser(String name, int age, String bloodGroup, String location,
      String lastDonationDate) async {
    return await userCollection.document(uid).setData({
      'userName': name,
      'userAge': age,
      'userBG': bloodGroup,
      'userLocation': location,
      'userLastDonation': lastDonationDate,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      userID: uid,
      userName: snapshot.data['userName'] ?? "",
      userBG: snapshot.data['userBG'] ?? "",
      userAge: snapshot.data['userAge'] ?? "",
      userLastDonation: snapshot.data['userLastDonation'] ?? "",
      userLocation: snapshot.data['userLocation'] ?? "",
      userPhone: snapshot.data['userPhone'] ?? "",
    );
  }

  Stream<UserData> get getUserData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

// ----------------------------------------------------------------------------------------
// This function is just to check if the the passed user ID is of customer or chef
  Future<bool> checkUserID(FirebaseUser userID) async {
    final userCheck =
        (await userCollection.where("userID", isEqualTo: userID).getDocuments())
            .documents;

    // print("cust.documents.exist in custUserFuctnion for " +
    //     userID +
    //     " : ____________ " +
    //     custCheck.toString());
    // print("chef.documents.exist in chefUserFuctnion for " +
    //     userID +
    //     " : ____________ " +
    //     chefCheck.toString());
    return userCheck.length > 0 ? true : false;
  }

  Future<bool> phoneNoExist(String _phoneNo) async {
    var checkPhone = await userCollection
        .where("userPhone", isEqualTo: _phoneNo)
        .getDocuments();
    return checkPhone.documents.length > 0 ? true : false;
  }
}
