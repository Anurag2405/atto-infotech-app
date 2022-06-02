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
    ),
  );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
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
            return "Please select a service";
          } else {
            return null;
          }
        },
          value: dropval,
          hint: Text("Choose type of service"),
          isExpanded: true,
          iconSize: 36,
          icon: Icon(Icons.arrow_drop_down),
          items: items.map(buildMenuItem).toList(),
          onChanged: (dropval) => setState(() => this.dropval = dropval)
      ),
    ),
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
