class User {
  final String uid;
  User({this.uid});
}

class UserData {
  String userID;
  DateTime userAge;
  String userLocation;
  DateTime userLastDonation;
  String userBG;
  String userName;
  String userPhone;

  UserData({
    this.userID,
    this.userName,
    this.userAge,
    this.userBG,
    this.userLastDonation,
    this.userLocation,
    this.userPhone,
  });
}
