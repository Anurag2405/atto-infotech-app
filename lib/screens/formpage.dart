import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';
class Infoform extends StatefulWidget {
  const Infoform({Key? key}) : super(key: key);

  @override
  State<Infoform> createState() => _InfoformState();
}

class _InfoformState extends State<Infoform> {
  final formKey  = GlobalKey<FormState>();
  String name = '';
  String? email = '';
  String? phone_number;
  // String? dropval;
  DateTime? expDate;
  String? selectedItem;


  Widget buildname() => TextFormField(
      decoration: InputDecoration(
        labelText: "Name",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.person),
      ),
      validator: (value){
        if (value!.length < 4){
          return "Enter atleast 4 characters";
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
        name = value;
      })
  );

  Widget buildPhone() => TextFormField(
      decoration: InputDecoration(
        labelText: "Phone",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.phone),
      ),
      keyboardType: TextInputType.number,
      validator: (value){
        if (value!.length != 10){
          return "Enter a valid number";
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
        phone_number = value;
      })
  );


  Widget buildEmail() => TextFormField(
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
    onChanged: (value) => setState(() => email = value),
  );

  Widget buildSubmit() => SizedBox(
    height: 50,
    child: ElevatedButton(
      // style:  ElevatedButton.styleFrom(primary: Colors.green),
      child: Text(
        "Submit",
        style: TextStyle(fontSize: 24),
      ),
      onPressed: (){
        final isValid = formKey.currentState!.validate();
        if(isValid){
          print(name);
          print(email);
          print(phone_number);
          print(selectedItem);
          print(expDate);
        }
      },
    ),
  );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
    ),
  );

  Widget buildDrop() => SearchField(
    suggestions: [
      'Domain','Hosting','SSl','Email'
    ].map((e) => SearchFieldListItem(e, child: Text(e)))
        .toList(),
    hint: 'pick a service',
    searchInputDecoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    itemHeight: 50,
    maxSuggestionsInViewPort: 4,
    suggestionsDecoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),

    ),
    onSuggestionTap: (value){
      setState((){
        selectedItem = value.key.toString();
      });
    },
  );


  Widget buildexp() => Container(
    decoration: BoxDecoration(
      border:  Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(4),
    ),
    child: ListTile(
      title: Text(expDate == null ? "Pick the expiry date" : expDate.toString(),style: TextStyle(color: Colors.grey[600]),),
      trailing: Icon(Icons.calendar_month_outlined),
      onTap: () {
        showDatePicker(
          context: context,
          firstDate: DateTime(2015),
          lastDate: DateTime(2099),
          initialDate: expDate == null ? DateTime.now() : expDate!,
        ).then((date) {
          setState(() {
            expDate = date;
          });
        }
        );
      },
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("information form"),
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
