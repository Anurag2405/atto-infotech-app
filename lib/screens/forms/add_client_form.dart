import 'package:attoform/services/database.dart';
import 'package:flutter/material.dart';

class AddClientForm extends StatefulWidget {
  const AddClientForm({Key? key}) : super(key: key);

  @override
  State<AddClientForm> createState() => _AddClientFormState();
}

class _AddClientFormState extends State<AddClientForm> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String emailId = '';
  String phoneNumber = '';
  String gstNo = "";

  Widget buildname() => TextFormField(
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

  Widget buildgst() => TextFormField(
      decoration: InputDecoration(
        labelText: "GST number",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value!.length < 1) {
          return "Enter proper gst number";
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
        gstNo = value;
      }));

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
              DatabaseService().createClientMaster(
                  name, emailId, phoneNumber,gstNo).then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Client Added!'),
                  ),
                ),
                Navigator.pop(context),
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => Mainpage())),
              });
            }
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
            buildgst(),
            const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      ),
    );
  }
}
