import 'package:brue_crew/models/user.dart';
import 'package:brue_crew/services/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class authservice
{
  final FirebaseAuth _auth = FirebaseAuth.instance;

 User _userfromfirebaseuser(FirebaseUser user){

   return user!=null ? User(uid: user.uid) :null ;

 }

Stream<User> get user{
  return _auth.onAuthStateChanged
  //.map((FirebaseUser user) => _userfromfirebaseuser(user)); //same as below 
.map(_userfromfirebaseuser);

}
  // sign in anom
  Future signInAnom () async {

    try {
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userfromfirebaseuser(user) ;
    }
    catch(e)
    {
      print(e.toString());
      return null;

    }
  }

// register in with email an d password
Future registerWithEmailAndPassword(String email,String password) async{

try {
  AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  FirebaseUser user = result.user;
  await DatabaseService(uid: user.uid).updateUser('test', '0', 100);
  return _userfromfirebaseuser(user);
}catch(e){
  print(e.toString());
}
}

// signIn user with eemail and password
Future signInWithEmailAndPassword(String email,String password) async{

try {
  AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
  FirebaseUser user = result.user;
  return _userfromfirebaseuser(user);
}catch(e){
  print(e.toString());
}
}
  //signout 
  Future signout () async {
    try {
         return await _auth.signOut();
      

    }catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}