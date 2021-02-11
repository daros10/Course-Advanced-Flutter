import 'package:flutter/material.dart';

class User {
  String name;
  int age;
  String hobbies;
  List<String> skills;

  User({@required this.name, this.age, this.hobbies, this.skills});
}
