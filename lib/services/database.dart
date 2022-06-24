import 'package:attoform/models/client.dart';
import 'package:attoform/models/product.dart';
import 'package:attoform/widget/client_product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class DatabaseService {
  var uuid = Uuid();
  //collection reference
  final CollectionReference _clientMaster =
      FirebaseFirestore.instance.collection('Client Master');
  final CollectionReference _productsMaster =
      FirebaseFirestore.instance.collection('Product Master');
  final CollectionReference _clientProductMaster =
      FirebaseFirestore.instance.collection('Client Product Master');

  //create client master
  Future createClientMaster(String name, String emailId, String phoneNumber,
      String service, String expDate) async {
    var v4 = uuid.v4();
    // print(v4);
    // print(name);
    return await _clientMaster.doc(v4).set({
      'uid': v4,
      'name': name,
      'emailId': emailId,
      'phoneNumber': phoneNumber,
      'service': service,
      'expDate': expDate
    });
  }

//update client
  Future updateClientMaster(
      String v4, String name, String emailId, String phoneNumber) async {
    return await _clientMaster.doc(v4).set({
      'uid': v4,
      'name': name,
      'emailId': emailId,
      'phoneNumber': phoneNumber,
    });
  }

  //update Product
  Future updateProductMaster(
      String v4, String productName, String price) async {
    return await _productsMaster
        .doc(v4)
        .set({'uid': v4, 'name': productName, 'price': price});
  }

  //create product in product master
  Future createProductMaster(String productName, String price) async {
    // print(productName);
    var v4 = uuid.v4();
    return await _productsMaster
        .doc(v4)
        .set({'uid': v4, 'name': productName, 'price': price});
  }

  ///Client-Product mapped functions

//to map client to product  --->> floating actio0n button -->>submit button
  Future createClientProductMaster(String v4, String name, String phoneNumber,
      String product, String price, String dateOfExpiry, String note) async {
    return await _clientProductMaster.doc(v4).set({
      'uid': v4,
      'name': name,
      'phoneNumber': phoneNumber,
      'product': product,
      'price': price,
      'expDate': dateOfExpiry,
      'note': note
    });
  }

  //update the clientProduct master eg expDate

// to get client list from firebase :

  List<Client> _clientListFromFirebaseCollection(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Client(
        uid: doc['uid'] ?? '',
        name: doc['name'] ?? '',
        email: doc['emailId'] ?? '',
        phoneNumber: doc['phoneNumber'],
      );
    }).toList();
  }

  Stream<List<Client>> get clientMasterStream {
    return _clientMaster.snapshots().map(_clientListFromFirebaseCollection);
  }

// to get product list from firebase :

  List<Product> _productListFromFirebaseCollection(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Product(
        uid: doc['uid'] ?? '',
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
