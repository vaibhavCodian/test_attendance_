import 'dart:convert';

import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_attendance/utils/calls.dart';

import 'Models/User.dart';
import 'utils/widgets.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late Future<List> futureUsers;
  var _listOfUsers = [];
  var _listOfSearchedUsers = [];
  bool _isSearching = false;
  bool _isLoading = false;

  Future<List> fetchUsers() async {
    _isLoading = true;
    final response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbwOkF3PIpjSrrHBsiXoVnsctWDDQIsG8FcUbERWG3aBHOHZ5a0Evn-DodJx9t1evrg/exec?action=getUsers'));
    if (response.statusCode == 200) {
      _listOfUsers = [];
      jsonDecode(response.body).forEach((element) {
        print(element);
        _listOfUsers.add(User.fromJson(element));
        print(_listOfUsers);
      });
      setState(() {
        _isLoading = false;
      });
      return _listOfUsers;
    } else {
      throw Exception('Failed to load Users');
    }
  }

  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearchSwitch(
        onCleared: () {
          _isSearching = false;
          setState(() {});
        },
        onChanged: (text) {
          if (text.isNotEmpty) {
            _isSearching = true;
            _listOfSearchedUsers = searchResult(text);
            setState(() {});
          } else {
            _isSearching = false;
          }
        }, // onSubmitted: (text) => searchText.value = text,
        backgroundColor: Colors.blue.shade300,
        appBarBuilder: (context) {
          return AppBar(
            backgroundColor: Colors.blue.shade500,
            foregroundColor: Colors.white,
            title: Text(' Science Of Self Discovery '),
            actions: [
              AppBarSearchButton(
                searchActiveButtonColor: Colors.blue.shade200,
              ),
            ],
          );
        },
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: fetchUsers,
          color: Colors.lightBlueAccent,
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: _isSearching
                      ? _listOfSearchedUsers.length
                      : _listOfUsers.length,
                  itemBuilder: (context, index) {
                    User user = _isSearching
                        ? _listOfSearchedUsers[index]
                        : _listOfUsers![index];
                    return Card(
                        color: user.attendance
                            ? Colors.orange.shade50
                            : Colors.white,
                        child: ListTile(
                            title: Text(user.name),
                            subtitle: Text(user.number.toString()),
                            trailing: Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                side: BorderSide(style: BorderStyle.solid),
                                checkColor: Colors.blue,
                                activeColor: Colors.blue.shade50,
                                value: user.attendance,
                                onChanged: (val) async {
                                  markAttendance(user);
                                  setState(() {
                                    user.setAttendance(val!);
                                  });
                                },
                              ),
                            )));
                  }),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "add",
            backgroundColor: Colors.blue.shade400,
            foregroundColor: Colors.white,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AddAttendeeDialog();
                  });
            },
            child: const Icon(Icons.person_add_outlined),
          ),
          const SizedBox(width: 20),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  searchResult(String text) {
    return _listOfUsers
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
