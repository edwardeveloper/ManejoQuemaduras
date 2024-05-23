import 'package:flutter/material.dart';
import 'package:proyectoaula/models/user/user-email.dart';
import 'package:proyectoaula/models/user/user-name.dart';

Future<bool> UpdateUserData({String name, String email, String age}) async {
  if (name != null && name != "") {
    setUserName(userName: name);
  }
  if (email != null && email != "") {
    setUserEmail(userEmail: email);
  }
}
