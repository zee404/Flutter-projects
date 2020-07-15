class User {
  final String uid;
  User({this.uid});
}

class UserData {
  String userID;
  DateTime userDOB;
  String userLocation;
  DateTime userLastDonation;
  String userBG;
  String userName;
  String userPhone;

  UserData({
    this.userID,
    this.userName,
    this.userDOB,
    this.userBG,
    this.userLastDonation,
    this.userLocation,
    this.userPhone,
  });
}
