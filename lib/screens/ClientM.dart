import 'package:attoform/models/client.dart';
import 'package:attoform/models/clientprodmap.dart';
import 'package:attoform/screens/forms/add_clientmap_form.dart';
import 'package:attoform/screens/forms/edit_client_form.dart';
import 'package:attoform/screens/forms/edit_clientmap_form.dart';
import 'package:attoform/screens/products.dart';
import 'package:attoform/widget/client_product_card.dart';
import 'package:attoform/screens/forms/add_client_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:attoform/widget/search_widget.dart';
import 'package:provider/provider.dart';
import 'package:attoform/screens/mainpage.dart';
import 'package:attoform/services/database.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String query = '';
  late List<ClientProduct> clientProduct;

  // Search Functionality
  Future? resultsLoaded;
  List _allResults = [];
  List _resultsList = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(_onSearchChanged);

  }

  _onSearchChanged(){
    searchResultsList();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getClientM();
  }

  getClientM() async{
    var data = await FirebaseFirestore.instance
        .collection('Client Product Master')
        .get();
    setState(() {
      _allResults = data.docs.map((doc) {
        return ClientProduct(
            uid: doc['uid'] ?? '',
            name: doc['name'] ?? '',
            phoneNumber: doc['phoneNumber'],
            product: doc['product'] ?? '',
            price: doc['price'] ?? '',
            dateOfExpiry: doc['expDate'] ?? '',
            note: doc['note'] ?? ''
        );
      }).toList();
    });
    searchResultsList();
    return "complete";

  }

  searchResultsList() {
    var showResults = [];
    query = _searchController.text;
    // if(_searchController.text != "") {
    //   for(var clientprodsnap in _allResults){
    //     var title = ClientProduct.fromSnapshot(clientprodsnap).name.toLowerCase();
    //     if(title.contains(_searchController.text.toLowerCase())) {
    //       showResults.add(clientprodsnap);
    //     }
    //   }
    // }
    final _resultsList = _allResults.where((client) {
      final nameLower = client.name.toLowerCase();
      //final serviceLower = client.service.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
      //||serviceLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this._resultsList = _resultsList;
    });

    // if(_searchController.text != ""){
    //   final clients = _allResults.where((client) {
    //     final nameLower = client.name.toLowerCase();
    //     final searchLower = query.toLowerCase();
    //     return nameLower.contains(searchLower);
    //     //||serviceLower.contains(searchLower);
    //   }).toList();
    // }
    // else {
    //   showResults = List.from(_allResults);
    // }
    // setState(() {
    //   _resultsList = showResults;
    // });
  }



  //Search end


  @override
  Widget build(BuildContext context) {
    //actively listening to stream of return type Clients
    final clientprodListt = Provider.of<List<ClientProduct>>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Atto Infotech',
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "search ...",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blueGrey)),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child:
            //   ListView.builder(
            //     itemCount: _resultsList.length,
            //     itemBuilder: (BuildContext context, int index) =>
            //         ClientProductCard(clientProduct: _resultsList[index])
            // ),

              ListView.builder(
                // itemCount: clients.length,
                // itemBuilder: (context, int index) {
                //   return ClientCard(client: clients[index]);}
                itemCount: _resultsList.length,
                itemBuilder: (context, int index) {
                  return InkWell(
                    child: ClientProductCard(
                        clientProduct: _resultsList[index]),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>

                          EditMap(map: clientprodListt[index]),
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddMap()));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.indigo,
        ),
      ),
    );
  }
}
