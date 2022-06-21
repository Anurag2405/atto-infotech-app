import 'package:attoform/models/client.dart';
import 'package:attoform/models/product.dart';
import 'package:attoform/widget/client_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final CollectionReference _clientMaster =
      FirebaseFirestore.instance.collection('Client Master');
  final CollectionReference _productsMaster =
      FirebaseFirestore.instance.collection('Product Master');

  //update client master
  Future updateClientMaster(String name, String emailId, String phoneNumber,
      String service, String expDate) async {
    print(name);
    return await _clientMaster.doc().set({
      'name': name,
      'emailId': emailId,
      'phoneNumber': phoneNumber,
      'service': service,
      'expDate': expDate
    });
  }

  //update product master
  Future updateProductMaster(String productName, String price) async {
    print(productName);
    return await _productsMaster
        .doc(productName)
        .set({'name': productName, 'price': price});
  }
// to gt client list from firebase :

  List<Client> _clientListFromFirebaseCollection(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Client(
          uid: "",
          name: doc['name'] ?? '',
          email: doc['emailId'] ?? '',
          phoneNumber: doc['phoneNumber'],
          note: '',
          price: '1000',
          service: doc['service'] ?? '',
          dateOfExpiry: doc['expDate']);
    }).toList();
  }

  Stream<List<Client>> get clientMasterStream {
    return _clientMaster.snapshots().map(_clientListFromFirebaseCollection);
  }

// to get product list from firebase :

  List<Product> _productListFromFirebaseCollection(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Product(
        name: doc['name'] ?? '',
        productId: '1',
        price: doc['price'],
      );
    }).toList();
  }

  Stream<List<Product>> get productMasterStream {
    return _productsMaster.snapshots().map(_productListFromFirebaseCollection);
  }
}
