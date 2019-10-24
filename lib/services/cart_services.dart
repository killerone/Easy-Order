import 'package:cloud_firestore/cloud_firestore.dart';

class CartService {
  CartService();
  final CollectionReference FIRESTORE_REF = Firestore.instance
      .collection("cart")
      .document("TQIFryTnOnJCNYYCSTPt")
      .collection("items");

  Future<QuerySnapshot> getCart() {
    var data = FIRESTORE_REF.getDocuments();
    return data;
  }

  Future<DocumentSnapshot> getItem(String id) =>
      FIRESTORE_REF.document(id).get();

  Future<void> addToCart(
      String id, String name, String imagePath, int price) async {
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

  increaseQuantity(String id) => this.updateCartQuantity(id, 1);

  decreaseQuantity(String id) => this.updateCartQuantity(id, -1);

  updateCartQuantity(String id, int quantity) async {
    var item = await getItem(id);

    if (item.data['quantity'] + quantity == 0)
      item.reference.delete().then((onValue) => print("deleted"));
    else
      item.reference
          .updateData({'quantity': item.data['quantity'] + quantity}).then(
              (onValue) => print("updated $quantity"));
  }

  Future<dynamic> placeOrder(
      final String customization, final double totalAmount) async {
    final cart = await this.getCart();
    var order = [];
    if (cart.documents.length == 0) return 0;

    cart.documents.forEach((d) async {
      order.add(d.data);
      await d.reference.delete();
    });

    return Firestore.instance.collection("order").add({
      'items': order,
      'status': 0,
      'tableNumber': 5,
      'customization': customization,
      'totalAmount': totalAmount
    });
  }
}
