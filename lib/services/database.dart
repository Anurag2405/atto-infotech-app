import 'package:attoform/models/client.dart';
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
    return await _clientMaster.doc(name).set({
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

  // List<ClientCard> _clientCardFromFirebaseCollection(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return ClientCard(
  //         chatroomName: doc['chatroomName'], chatroomIcon: doc['Icon']);
  //   }).toList();
  // }

  // Stream<List<Client>> get clientMasterStream {
  //   return _clientMaster.snapshots().map(_clientCardFromFirebaseCollection);
  // }

}
