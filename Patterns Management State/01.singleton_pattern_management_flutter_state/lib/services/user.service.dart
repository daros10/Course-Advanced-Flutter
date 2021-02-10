import 'dart:async';

import 'package:estado_singleton_flutter/models/user.dart';

class UserService {
  User _user;
  StreamController<User> _userStreamController =
      new StreamController<User>.broadcast();

  User get getUserInformatio => this._user;

  void setUserInformation(User user) {
    this._user = user;
    _userStreamController.add(user);
  }

  void setNewAgeUser(int age) {
    this._user.age = age;
    this._userStreamController.add(_user);
  }

  void setNewHoobie(String hoobie) {
    this._user.hobbies = hoobie;
  }

  bool get isUserInitialized => this._user == null ? false : true;
  Stream<User> get streamUser => _userStreamController.stream;
}

final userService = new UserService();
