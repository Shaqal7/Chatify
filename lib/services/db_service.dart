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
  
  Future<void> updateUserLastSeenTime(String _userID){
    var _ref = _db.collection(_userCollection).document(_userID);
    return _ref.updateData({"lastSeen": Timestamp.now()});
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

  Stream<List<Contact>> getUsersInDB(String _searchName) {
    var _ref = _db.collection(_userCollection).where(
        "name", isGreaterThanOrEqualTo: _searchName
    ).where(
        "name", isLessThan: _searchName + 'z'
    );
    return _ref.getDocuments().asStream().map((_snapshot){
      return _snapshot.documents.map((_doc) {
        return Contact.fromFirestore(_doc);
      }).toList();
    });
  }

  Stream getConversation(String _conversationID){
    var _ref = _db.collection(_conversationsCollection).document(_conversationID);
    return _ref.snapshots().map((_snapshot){
      return Conversation.fromFirestore(_snapshot);
    });
  }
}