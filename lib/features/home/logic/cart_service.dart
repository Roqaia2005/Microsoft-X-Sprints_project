import 'package:firebase_auth/firebase_auth.dart';
import 'package:souqak/features/home/data/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _uid => _auth.currentUser?.uid;

  Future<void> addItemToCart(Item item) async {
    if (_uid == null) return; // not logged in
    await _firestore
        .collection("users")
        .doc(_uid)
        .collection("cart")
        .add(item.toJson());
  }

  Stream<List<Item>> getCartItems() {
    if (_uid == null) {
      return const Stream.empty(); // if not logged in
    }
    return _firestore
        .collection("users")
        .doc(_uid)
        .collection("cart")
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList());
  }

  Future<void> removeItemFromCart(String itemTitle) async {
    if (_uid == null) return; // not logged in
    await _firestore
        .collection("users")
        .doc(_uid)
        .collection("cart")
        .doc(itemTitle)
        .delete();
  }
}
