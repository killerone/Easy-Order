import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  CartService();
  CollectionReference FIRESTORE_REF = Firestore.instance
      .collection("cart")
      .document("table5")
      .collection("items");

  Future<QuerySnapshot> getCart() {
    var data = FIRESTORE_REF.getDocuments();
    return data;
  }

  Future<DocumentSnapshot> getItem(String id) {
    return FIRESTORE_REF.document(id).get();
  }

  Future<void> addToCart(String id, String name, String imagePath, int price) async {
    final ds = await FIRESTORE_REF.document(id).get();
    if (ds.data == null) {
      return ds.reference.setData({
        'name': name,
        'price': price,
        'imagePath': imagePath,
        'quantity': 1
      });
    } else {
      return ds.reference.updateData({'quantity': ds.data['quantity'] + 1});
    }
  }

  increaseQuantity(String id) {
    this.updateCartQuantity(id, 1);
  }

  decreaseQuantity(String id) {
    this.updateCartQuantity(id, -1);
  }

  updateCartQuantity(String id, int quantity) async {
    var item = await getItem(id);

    if (item.data['quantity'] + quantity == 0)
      item.reference.delete().then((onValue) => print("deleted"));
    else
      item.reference
          .updateData({'quantity': item.data['quantity'] + quantity}).then(
              (onValue) => print("updated $quantity"));
  }
}
