import 'package:cloud_firestore/cloud_firestore.dart';

class QrService {
  final CollectionReference _productReference =
      FirebaseFirestore.instance.collection("products");


  Future<List<QueryDocumentSnapshot>> products() async {
    var products = await _productReference.get();
    return products.docs;
  }
}
