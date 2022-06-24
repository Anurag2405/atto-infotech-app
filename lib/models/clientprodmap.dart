import 'package:cloud_firestore/cloud_firestore.dart';
class ClientProduct {
  String uid;
  String name;
  String phoneNumber;
  String product;
  String price;
  String dateOfExpiry;
  String note;

  ClientProduct(
      {required this.uid,
      required this.name,
      required this.phoneNumber,
      required this.product,
      required this.price,
      required this.dateOfExpiry,
      required this.note});

  ClientProduct.fromSnapshot(DocumentSnapshot snapshot) :
        uid = snapshot['uid'],
        name = snapshot['name'],
        phoneNumber = snapshot['name'],
        product = snapshot['name'],
        price = snapshot['name'],
        dateOfExpiry = snapshot['name'],
        note = snapshot['name'];
}

List<ClientProduct> demoClientProductList = [
  ClientProduct(
      uid: "uid",
      name: "atto infotech",
      phoneNumber: '1000000',
      product: 'product',
      price: '100000',
      dateOfExpiry: '2/10/2022',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Microsoft India",
      phoneNumber: '1000000',
      product: 'product',
      price: '100000',
      dateOfExpiry: '2/10/2022',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Goldman Sachs",
      phoneNumber: '1000000',
      product: 'product',
      price: '100000',
      dateOfExpiry: '2/10/2022',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Samsung India",
      phoneNumber: '1000000',
      product: 'product',
      price: '100000',
      dateOfExpiry: '2/10/2022',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Vesit",
      phoneNumber: '1000000',
      product: 'product',
      price: '100000',
      dateOfExpiry: '2/10/2022',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Vesit",
      phoneNumber: '1000000',
      product: 'product',
      price: '100000',
      dateOfExpiry: '2/10/2022',
      note: 'this is note'),
];
