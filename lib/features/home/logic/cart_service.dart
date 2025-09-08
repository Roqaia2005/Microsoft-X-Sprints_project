import 'package:firebase_auth/firebase_auth.dart';
import 'package:souqak/features/home/data/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get uid => _auth.currentUser?.uid;

  Future<void> addItemToCart(Item item) async {
    if (uid == null) return; // not logged in

    final cartRef = _firestore.collection("users").doc(uid).collection("cart");

    final existing = await cartRef.where("title", isEqualTo: item.title).get();

    if (existing.docs.isNotEmpty) {
      return;
    }

    // Add only if not exists
    await cartRef.add(item.toJson());
  }

  Stream<List<Item>> getCartItems() {
    if (uid == null) {
      return const Stream.empty(); // if not logged in
    }
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("cart")
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Item.fromJson(doc.data())).toList(),
        );
  }

  Future<void> removeItemFromCart(String uid, String itemTitle) async {
    final querySnapshot = await _firestore
        .collection("users")
        .doc(uid)
        .collection("cart")
        .where("title", isEqualTo: itemTitle) // field name in your Item model
        .get();

    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }
}
