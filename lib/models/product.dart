class Product {
  String uid;
  String name;
  String productId;
  String price;
  Product({required this.uid,required this.name, required this.productId, required this.price});
}

List<Product> demoProductList = [
  Product(uid: "uid",name: 'Domain', productId: '1', price: '5000'),
  Product(uid: "uid",name: 'Hosting', productId: '2', price: '10000'),
  Product(uid: "uid",name: 'App development', productId: '3', price: '30000'),
  Product(uid: "uid",name: 'SSL', productId: '4', price: '20000')
];
