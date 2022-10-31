import 'dart:convert';

import '../Models/User.dart';
import 'package:http/http.dart' as http;

markAttendance(User user) async {
  final queryParameters = {
    'Number': user.number
  };
  var response;
  if (user.attendance){
    response = await http.post(
        Uri.parse('https://script.google.com/macros/s/AKfycbwOkF3PIpjSrrHBsiXoVnsctWDDQIsG8FcUbERWG3aBHOHZ5a0Evn-DodJx9t1evrg/exec?action=unmarkAttendance'),
        body: json.encode(queryParameters)
    );
    print(response);
  } else {
    response = await http.post(
        Uri.parse('https://script.google.com/macros/s/AKfycbwOkF3PIpjSrrHBsiXoVnsctWDDQIsG8FcUbERWG3aBHOHZ5a0Evn-DodJx9t1evrg/exec?action=markAttendance'),
        body: json.encode(queryParameters)
    );
  }

  if (response.statusCode == 200) {

  } else {
    throw Exception(response.toString());
  }
}


addStudent(String Name, String Number, String Facilitator, String Age, Occupation ) {
  // {
  //   "Name": "Vaibhav Shukla",
  // "Number": "9920872358",
  // "Age": "20",
  // "Occupation": "Student",
  // "Facilitator": "Narayan"
  // }
  final param = {
    'Name': Name,
    'Number': Number,
    'Facilitator': Facilitator,
    'Age': Age,
    'Occupation': Occupation
  };
  // var response;
  // if (user.attendance){
  //   response = await http.post(
  //       Uri.parse('https://script.google.com/macros/s/AKfycbwOkF3PIpjSrrHBsiXoVnsctWDDQIsG8FcUbERWG3aBHOHZ5a0Evn-DodJx9t1evrg/exec?action=unmarkAttendance'),
  //       body: json.encode(queryParameters)
  //   );
  //   print(response);
  // } else {
  //   response = await http.post(
  //       Uri.parse('https://script.google.com/macros/s/AKfycbwOkF3PIpjSrrHBsiXoVnsctWDDQIsG8FcUbERWG3aBHOHZ5a0Evn-DodJx9t1evrg/exec?action=markAttendance'),
  //       body: json.encode(queryParameters)
  //   );
  // }
  //
  // if (response.statusCode == 200) {
  //
  // } else {
  //   throw Exception(response.toString());
  // }

}