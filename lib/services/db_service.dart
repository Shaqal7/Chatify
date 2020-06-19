import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/contact.dart';
import '../models/conversation.dart';

class DBService {
  static DBService instance = DBService();

  Firestore _db;

  DBService(){
    _db = Firestore.instance;
  }

  String _userCollection = "Users";
  String _conversationsCollection = "Conversations";

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

  Stream<List<ConversationSnippet>> getUserConversations(String _userID) {
    var _ref = _db.collection(_userCollection).document(_userID).collection(_conversationsCollection);
    return _ref.snapshots().map((_snapshot){
      return _snapshot.documents.map((_doc) {
        return ConversationSnippet.fromFirestore(_doc);
      }).toList();
    });
  }
}