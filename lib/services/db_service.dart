import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contact.dart';

class DBService {
  static DBService instance = DBService();

  Firestore _db;

  DBService(){
    _db = Firestore.instance;
  }

  String _userCollection = "Users";

  Future<void> createUserInDB(
    String _uid, String _name, String _email, String _imageURL) async {
      try{
        return await _db.collection(_userCollection).document(_uid).setData({
          "name": _name,
          "email": _email,
          "image": _imageURL,
          "lastSeen": DateTime.now().toUtc(),
        });
      } catch(e){
        print(e);
      }
  }

  Stream<Contact> getUserData(String _userID) {
    var _ref = _db.collection(_userCollection).document(_userID);
    return _ref.get().asStream().map((_snapshot) {
      return Contact.fromFirestore(_snapshot);
    });
  }
}