class ClientProd {
  String uid;
  String name;
  String product;
  String price;
  String dateOfExpiry;

  ClientProd(
      {required this.uid,
        required this.name,
        required this.product,
        required this.price,
        required this.dateOfExpiry});
}


ClientProd Anu = ClientProd(uid: "uid", name: "Anu", product: "Domain", price: "500", dateOfExpiry: "24/5");