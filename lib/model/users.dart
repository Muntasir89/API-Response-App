import 'package:api_response/model/user_dob.dart';
import 'package:api_response/model/user_loacation.dart';
import 'package:api_response/model/user_name.dart';
import 'package:api_response/model/user_picture.dart';
class User{
  final String gender, email, phone, cell, nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });
  factory User.fromMap(Map<String, dynamic>e){
    final name = UserName.fromMap(e['name']);
    final date = e['dob']['date'];
    final dob = UserDob(age: e['dob']['age'], date: DateTime.parse(date));

    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);
    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture
    );
  }

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}