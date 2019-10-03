import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_order/cart.dart';

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

  addToCart(item, quantity) {
    updateCartQuantity(item.id, quantity);
  }

  updateCartQuantity(String id, int quantity) async {
    var item = await getItem(id);

    // checking if item already exists in cart or not
    if (item.data == null)
      // if not. then adding it into cart
      item.reference.setData({
        'name': "Paneer Makhni ",
        'price': 350,
        'imagePath':
            'https://firebasestorage.googleapis.com/v0/b/too-easy-order.appspot.com/o/images%2FPaneerMakhni.jpg?alt=media&token=a6b26e24-7802-42b6-ba80-154e762d930e',
        'quantity': quantity
      }).then((onValue) => print("added"));
    else {
      // checking whether updated quantity will be 0 or not
      // if yes then removing item from cart
      if (item.data['quantity'] + quantity == 0)
        item.reference.delete().then((onValue) => print("deleted"));
      else

        // else increase the quantity with new one
        item.reference
            .updateData({'quantity': item.data['quantity'] + quantity}).then(
                (onValue) => print("updated"));
    }
  }
}
