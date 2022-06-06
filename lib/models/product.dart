class Product {
  String name;
  String productId;
  String price;
  Product({required this.name, required this.productId, required this.price});
}

List<Product> productList = [
  Product(name: 'Domain', productId: '1', price: '5000'),
  Product(name: 'Hosting', productId: '2', price: '10000'),
  Product(name: 'App development', productId: '3', price: '30000'),
  Product(name: 'SSL', productId: '4', price: '20000')
];
