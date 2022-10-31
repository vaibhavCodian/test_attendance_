/// Name : "Krishna Das 1"
/// Number : 82915108521
/// Age : 20
/// Occupation : ""
/// Facilitator : "Mangal Manvinder"
/// Date Of Registration : "2022-10-20T18:30:00.000Z"
/// Status : "Active"

class User {
  late String _name;
  late num _number;
  late num _age;
  late String _occupation;
  late String _facilitator;
  late String _dateOfRegistration;
  late String _status;
  late bool _attendance = false;

  User({
      required String name,
      required num number,
      required num age,
      required String occupation,
      required String facilitator,
      required String dateOfRegistration,
      required String status,
      required bool attendance
  }){
    _name = name;
    _number = number;
    _age = age;
    _occupation = occupation;
    _facilitator = facilitator;
    _dateOfRegistration = dateOfRegistration;
    _status = status;
    _attendance = attendance;
}

  User.fromJson(dynamic json) {
    _name = json['Name'];
    _number = json['Number'];
    _age = json['Age'];
    _occupation = json['Occupation'];
    _facilitator = json['Facilitator'];
    _dateOfRegistration = json['Date Of Registration'];
    _status = json['Status'];
    _attendance = (json['Attendance'] == 'PRESENT')?true:false;
  }


User copyWith({  required String name,
  required num number,
  required num age,
  required String occupation,
  required String facilitator,
  required String dateOfRegistration,
  required String status,
}) => User(  name: name ?? _name,
  number: number ?? _number,
  age: age ?? _age,
  occupation: occupation ?? _occupation,
  facilitator: facilitator ?? _facilitator,
  dateOfRegistration: dateOfRegistration ?? _dateOfRegistration,
  status: status ?? _status, attendance: false,
);
  String get name => _name;
  num get number => _number;
  num get age => _age;
  String get occupation => _occupation;
  String get facilitator => _facilitator;
  String get dateOfRegistration => _dateOfRegistration;
  String get status => _status;
  bool get attendance => _attendance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Number'] = _number;
    map['Age'] = _age;
    map['Occupation'] = _occupation;
    map['Facilitator'] = _facilitator;
    map['Date Of Registration'] = _dateOfRegistration;
    map['Status'] = _status;
    map['Attendance'] = _attendance;
    return map;
  }

  void setAttendance(bool bool) {
    _attendance = bool;
  }

}