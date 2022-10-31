import 'package:flutter/material.dart';
import 'package:test_attendance/utils/calls.dart';

TextEditingController NameController = TextEditingController();
TextEditingController NumberController = TextEditingController();
TextEditingController FacilitatorController = TextEditingController();
TextEditingController AgeController = TextEditingController();
TextEditingController OccupationController = TextEditingController();

Widget AddAttendeeDialog() {
  return AlertDialog(
    insetPadding: EdgeInsets.zero,
    scrollable: true,
    title: const Text('Add New Attendee'),
    content: Padding(
      padding: const EdgeInsets.all(1.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: NameController,
              decoration: InputDecoration(
                labelText: 'Name *',
                icon: Icon(Icons.account_box),
              ),
            ),
            TextFormField(
              controller: NumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Number *',
                icon: Icon(Icons.local_phone_outlined),
              ),
            ),
            TextFormField(
              controller: FacilitatorController,
              decoration: InputDecoration(
                labelText: 'Facilitator *',
                icon: Icon(Icons.connect_without_contact_rounded ),
              ),
            ),
            TextFormField(
              controller: OccupationController,
              decoration: InputDecoration(
                labelText: 'Occupation',
                icon: Icon(Icons.work ),
              ),
            ),
            TextFormField(
              controller: AgeController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Age',
                icon: Icon(Icons.group)
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      ElevatedButton(
          child: Text("Add"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue.shade400),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ) ,
          onPressed: () {
            if(NameController.text.isEmpty || NumberController.text.isEmpty || FacilitatorController.text.isEmpty){
              print("Please Provide Appropriate Values.");
            } else {
              addStudent(NameController.text, NumberController.text, FacilitatorController.text, OccupationController.text, AgeController.text);
            }
            // your code
          })
    ],
  );
}