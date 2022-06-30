import 'package:attoform/models/client.dart';
import 'package:attoform/screens/forms/edit_client_form.dart';
import 'package:attoform/screens/forms/add_client_form.dart';
import 'package:attoform/widget/client_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientListing extends StatefulWidget {
  const ClientListing({Key? key}) : super(key: key);

  @override
  State<ClientListing> createState() => _ClientListingState();
}

class _ClientListingState extends State<ClientListing> {

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
        .collection('Client Master')
        .get();
    setState(() {
      _allResults = data.docs.map((doc) {
        return Client(
            uid: doc['uid'] ?? '',
            name: doc['name'] ?? '',
            email: doc['emailId'] ?? '',
            phoneNumber: doc['phoneNumber'],
            gstNo: doc['gstNo']
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
      // final serviceLower = client.product.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
          // || serviceLower.contains(searchLower);
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
    final clientListt = Provider.of<List<Client>>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset('assets/icon.png',),
        title: const Text(
          'Client Listing',
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
                    child: ClientCard(client: _resultsList[index]),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Editclient(client: _resultsList[index]),
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn3",
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddClientForm()));
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
