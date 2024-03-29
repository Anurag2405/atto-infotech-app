
class ClientProduct {
  String uid;
  String name;
  String product;
  String price;
  String dateOfExpiry;
  String note;

  ClientProduct(
      {required this.uid,
      required this.name,
      required this.product,
      required this.price,
      required this.dateOfExpiry,
      required this.note});
}

List<ClientProduct> demoClientProductList = [
  ClientProduct(
      uid: "uid",
      name: "atto infotech",
      product: 'product',
      price: '100000',
      dateOfExpiry: '2022-06-30 00:00:00.000',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Microsoft India",
      product: 'product',
      price: '100000',
      dateOfExpiry: '2022-06-30 00:00:00.000',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Goldman Sachs",
      product: 'product',
      price: '100000',
      dateOfExpiry: '2022-06-30 00:00:00.000',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Samsung India",
      product: 'product',
      price: '100000',
      dateOfExpiry: '2022-06-30 00:00:00.000',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Vesit",
      product: 'product',
      price: '100000',
      dateOfExpiry: '2022-06-30 00:00:00.000',
      note: 'this is note'),
  ClientProduct(
      uid: "uid",
      name: "Vesit",
      product: 'product',
      price: '100000',
      dateOfExpiry: '2022-06-30 00:00:00.000',
      note: 'this is note'),
];
