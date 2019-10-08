import 'package:cloud_firestore/cloud_firestore.dart';

class DishService {
  getDish(String id) async {
    return await Firestore.instance.collection("dish").document(id).get();
  }
}
