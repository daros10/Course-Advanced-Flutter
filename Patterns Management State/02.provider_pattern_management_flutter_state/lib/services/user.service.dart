import 'package:flutter/material.dart';
import '../models/user.dart';

// En provider a diferencia del singleton necesito mezclar la clase
// con un changeNotifier. También nos permite abstraer la implementación
// de un StreamController.
class UserService with ChangeNotifier {
  User _user;

  User get getUser => this._user;
  bool get isUserInitialized => this._user == null ? false : true;

  set serUserInformation(User user) {
    this._user = user;
    notifyListeners();
  }

  void changeEdad(int age) {
    this._user.age = age;
    notifyListeners();
  }

  void resetUser() {
    this._user = null;
    notifyListeners();
  }
}
