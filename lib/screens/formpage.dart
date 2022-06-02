import 'package:flutter/material.dart';

class Infoform extends StatefulWidget {
  const Infoform({Key? key}) : super(key: key);

  @override
  State<Infoform> createState() => _InfoformState();
}

class _InfoformState extends State<Infoform> {
  final formKey  = GlobalKey<FormState>();
  final items = ['Domain','Hosting','SSl','Email'];
  String name = '';
  String? email = '';
  String? phone_number;
  String? dropval;
  DateTime? expDate;


  Widget buildname() => TextFormField(
      decoration: InputDecoration(
        labelText: "Name",
        border: OutlineInputBorder(),
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

  Widget buildSubmit() => ElevatedButton(
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
        print(dropval);
        print(expDate);
      }
    },
  );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
    ),
  );

  Widget buildDrop() => Container(
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(

          value: dropval,
          isExpanded: true,
          iconSize: 36,
          icon: Icon(Icons.arrow_drop_down),
          items: items.map(buildMenuItem).toList(),
          onChanged: (dropval) => setState(() => this.dropval = dropval)
      ),
    ),
  );


  Widget buildexp() => ListTile(
    title: Text(expDate == null ? "Pick the expiry date" : expDate.toString()),
    trailing: Icon(Icons.arrow_drop_down),
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
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("information form"),
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
