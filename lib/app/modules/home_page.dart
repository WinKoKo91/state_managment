import 'package:flutter/material.dart';
import 'package:state_managment/app/user_model.dart';

class HomePage extends StatelessWidget {
  HomePage(this.model, {Key? key}) : super(key: key);
  UserModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ready To Travel'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Table(
          children: [
            TableRow(children: [
              const TableCell(child: Text('First Name')),
              TableCell(child: Text(model.firstName)),
            ]),
            TableRow(children: [
              const TableCell(child: Text('Last Name')),
              TableCell(child: Text(model.lastName)),
            ]),
            TableRow(children: [
              const TableCell(child: Text('Email')),
              TableCell(child: Text(model.email)),
            ]),
            TableRow(children: [
              const TableCell(child: Text('Data of Birth')),
              TableCell(child: Text(model.dob)),
            ]),
            TableRow(children: [
              const TableCell(child: Text('Gender')),
              TableCell(child: Text(model.gender)),
            ]),
            TableRow(children: [
              const TableCell(child: Text('Nationality')),
              TableCell(child: Text(model.nationality)),
            ]),
            TableRow(children: [
              const TableCell(child: Text('Country of Residence')),
              TableCell(child: Text(model.countryOfResidence)),
            ]),
            TableRow(children: [
              const TableCell(child: Text('Mobile')),
              TableCell(child: Text(model.mobile ?? "")),
            ]),
          ],
        ),
      ),
    );
  }
}
