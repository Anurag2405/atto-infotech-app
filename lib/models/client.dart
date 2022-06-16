class Client {
  String name;
  String email;
  String note;
  String price;
  String service;
  String dateOfExpiry;

  Client(
      {required this.name,
      required this.email,
      required this.note,
      required this.price,
      required this.service,
      required this.dateOfExpiry});
}

List<Client> demoClientList = [
  Client(
      name: "atto infotech",
      email: "attoInfotech@gmail.com",
      note: "note here",
      price: "7000",
      service: "Hosting",
      dateOfExpiry: "2/05/22"),
  Client(
      name: "Microsoft India",
      email: "attoInfotech@gmail.com",
      note: "note is here ",
      price: "8000",
      service: "SSL",
      dateOfExpiry: "2/05/22"),
  Client(
      name: "Goldman Sachs",
      email: "attoInfotech@gmail.com",
      note: "this is note",
      price: "2000",
      service: "Domain",
      dateOfExpiry: "2/05/22"),
  Client(
      name: "Samsung India",
      email: "attoInfotech@gmail.com",
      note: "note is here ",
      price: "4000",
      service: "SSL",
      dateOfExpiry: "2/05/22"),
  Client(
      name: "Vesit",
      email: "attoInfotech@gmail.com",
      note: "note is here ",
      price: "5000",
      service: "Hosting",
      dateOfExpiry: "2/05/22"),
  Client(
      name: "Vesit",
      email: "attoInfotech@gmail.com",
      note: "note is here ",
      price: "5000",
      service: "Hosting",
      dateOfExpiry: "2/05/22"),
];
