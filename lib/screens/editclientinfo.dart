import 'package:attoform/services/database.dart';
import 'package:flutter/material.dart';
import 'package:attoform/models/client.dart';

class Editclient extends StatefulWidget {
  Client client;
  Editclient({required this.client});

  @override
  State<Editclient> createState() => _EditclientState();
}

class _EditclientState extends State<Editclient> {
  final formKey = GlobalKey<FormState>();
  String? name;
  String? emailId;
  String? phoneNumber;
  DateTime? expDate;
  String? selectedItem;
  final items = ['Domain','Hosting','SSl','Email'];

  Widget buildname() => TextFormField(
    initialValue: widget.client.name,
      decoration: InputDecoration(
        labelText: "Name",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value!.length < 4) {
          return "Enter atleast 4 characters";
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
        name = value;
      }));

  Widget buildPhone() => TextFormField(
    initialValue: widget.client.phoneNumber,
      decoration: InputDecoration(
        labelText: "Phone",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.phone),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.length != 10) {
          return "Enter a valid number";
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
        phoneNumber = value;
      }));

  Widget buildEmail() => TextFormField(
    initialValue: widget.client.email,
    decoration: InputDecoration(
      labelText: 'Email',
      border: OutlineInputBorder(),
      suffixIcon: Icon(Icons.email),
    ),
    validator: (value) {
      final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
      final regExp = RegExp(pattern);

      if (value!.isEmpty) {
        return 'Enter an email';
      } else if (!regExp.hasMatch(value)) {
        return 'Enter a valid email';
      } else {
        return null;
      }
    },
    keyboardType: TextInputType.emailAddress,
    onChanged: (value) => setState(() => emailId = value),
  );

  Widget buildSubmit() => SizedBox(
    height: 50,
    child: ElevatedButton(
      // style:  ElevatedButton.styleFrom(primary: Colors.green),
      child: Text(
        "Submit",
        style: TextStyle(fontSize: 24),
      ),
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          name ??= widget.client.name;
          emailId ??= widget.client.email;
          phoneNumber ??= widget.client.phoneNumber;
          expDate ??= DateTime.parse(widget.client.dateOfExpiry);
          selectedItem ??= widget.client.service;

          DatabaseService().updateClientMaster(
              widget.client.uid,name.toString(), emailId.toString(), phoneNumber.toString(), selectedItem.toString(), expDate.toString()).then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Client Edited!'),
              ),
            ),
            Navigator.pop(context),
          });
        }
      },
    ),
  );

  // DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  //       value: item,
  //       child: Text(
  //         item,
  //       ),
  //     );
  //
  // Widget buildDrop() => SearchField(
  //       suggestions: ['Domain', 'Hosting', 'SSl', 'Email']
  //           .map((e) => SearchFieldListItem(e, child: Text(e)))
  //           .toList(),
  //       hint: 'pick a service',
  //       searchInputDecoration: InputDecoration(
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide(
  //             color: Colors.blueGrey,
  //             width: 1,
  //           ),
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(
  //             color: Colors.blue,
  //             width: 1,
  //           ),
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //       ),
  //       itemHeight: 50,
  //       maxSuggestionsInViewPort: 4,
  //       suggestionsDecoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       onSuggestionTap: (value) {
  //         setState(() {
  //           selectedItem = value.key.toString();
  //         });
  //       },
  //     );


  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item ,
    ),
  );


  Widget buildDrop() => Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              border: InputBorder.none),
          validator: (value){
            if (value == null){
              value = widget.client.service;
              return null;
            } else {
              return null;
            }
          },
          value: selectedItem,
          hint: Text(widget.client.service),
          isExpanded: true,
          iconSize: 36,
          icon: Icon(Icons.arrow_drop_down),
          items: items.map(buildMenuItem).toList(),
          onChanged: (dropval) => setState(() => this.selectedItem = dropval)
      ),
    ),
  );



  Widget buildexp() => Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(4),
    ),
    child: ListTile(
      title: Text(
        expDate == null ? widget.client.dateOfExpiry : expDate.toString(),
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: Icon(Icons.calendar_month_outlined),
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime(2015),
          lastDate: DateTime(2099),
          // initialDate: expDate == null ? DateTime.now() : expDate!,
          initialDate: DateTime.parse(widget.client.dateOfExpiry),
        ).then((date) {
          setState(() {
            expDate = date;
          });
        });
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client form"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildname(),
            const SizedBox(height: 16),
            buildEmail(),
            const SizedBox(height: 16),
            buildPhone(),
            const SizedBox(height: 16),
            buildDrop(),
            const SizedBox(height: 16),
            buildexp(),
            const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      ),
    );
  }
}
