import 'package:attoform/models/clientprodmap.dart';
import 'package:attoform/screens/forms/add_clientmap_form.dart';
import 'package:attoform/screens/forms/edit_clientmap_form.dart';
import 'package:attoform/widget/client_product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  // late List<ClientProduct> clientProduct;

  // Search Functionality
  String query = '';
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
            product: doc['product'] ?? '',
            price: doc['price'] ?? '',
            dateOfExpiry: doc['dateOfExpiry'] ?? '',
            note: doc['note'] ?? ''
        );
      }).toList();
    });
    searchResultsList();
    return "complete";
  }

  searchResultsList() {
    // var showResults = [];
    query = _searchController.text;

    final _resultsList = _allResults.where((client) {
      final nameLower = client.name.toLowerCase();
      final serviceLower = client.product.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower)
      || serviceLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this._resultsList = _resultsList;
    });

  }

  //Search end


  @override
  Widget build(BuildContext context) {
    //actively listening to stream of return type Clients
    final clientproductList = Provider.of<List<ClientProduct>>(context);
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
          Container(
            height: 42,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "search ...",
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView.builder(
                itemCount: _resultsList.length,
                itemBuilder: (context, int index) {
                  return InkWell(
                    child: ClientProductCard(clientProduct: _resultsList[index]),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditMap(clientProduct: _resultsList[index]),
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
