class Client {
  String uid;
  String name;
  String email;
  String phoneNumber;
  String note;
  String price;
  String service;
  String dateOfExpiry;

  Client(
      {required this.uid,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.note,
      required this.price,
      required this.service,
      required this.dateOfExpiry});
}

List<Client> demoClientList = [
  Client(
      uid: "uid",
      name: "atto infotech",
      email: "attoInfotech@gmail.com",
      phoneNumber: '1000000',
      note: "note here",
      price: "7000",
      service: "Hosting",
      dateOfExpiry: "2/05/22"),
  Client(
      uid: "uid",
      name: "Microsoft India",
      email: "attoInfotech@gmail.com",
      phoneNumber: '1000000',
      note: "note is here ",
      price: "8000",
      service: "SSL",
      dateOfExpiry: "2/05/22"),
  Client(
      uid: "uid",
      name: "Goldman Sachs",
      email: "attoInfotech@gmail.com",
      phoneNumber: '1000000',
      note: "this is note",
      price: "2000",
      service: "Domain",
      dateOfExpiry: "2/05/22"),
  Client(
      uid: "uid",
      name: "Samsung India",
      email: "attoInfotech@gmail.com",
      phoneNumber: '1000000',
      note: "note is here ",
      price: "4000",
      service: "SSL",
      dateOfExpiry: "2/05/22"),
  Client(
      uid: "uid",
      name: "Vesit",
      email: "attoInfotech@gmail.com",
      phoneNumber: '1000000',
      note: "note is here ",
      price: "5000",
      service: "Hosting",
      dateOfExpiry: "2/05/22"),
  Client(
      uid: "uid",
      name: "Vesit",
      email: "attoInfotech@gmail.com",
      phoneNumber: '1000000',
      note: "note is here ",
      price: "5000",
      service: "Hosting",
      dateOfExpiry: "2/05/22"),
];
