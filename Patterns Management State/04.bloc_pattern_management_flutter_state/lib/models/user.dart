import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;
  final String hobbies;

  User({@required this.name, this.age, this.hobbies});

  User copyWith({String name, int age, String hobbies}) {
    return User(
        name: name ?? this.name,
        age: age ?? this.age,
        hobbies: hobbies ?? this.hobbies);
  }
}
