import 'package:flutter/material.dart';
import 'package:test_attendance/HomePage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List courses = ['Science Of Self Discovery', 'Bhagvad Gita Applied'];
  String courseSelected = 'Science Of Self Discovery';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20,10,20,10),
          child: ListView(
            children: <Widget>[
              Image.asset("assets/images/tilak.png", height: 250),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'वैष्णव Attendance',
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Facilitator Login',
                    style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(

                padding: const EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1)
                ),
                child: DropdownButton(
                  hint: Text("Select Course"),
                  value: courseSelected,
                  dropdownColor: Colors.orange.shade100,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: courses.map((items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      courseSelected = value.toString();
                    });
                  },
                ),
              ),
              SizedBox(height: 40),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  )
              ),
            ],
          )),
    );
  }
}