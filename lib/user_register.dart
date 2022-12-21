// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class User_register {
  final String user;
  final String pass;
  final String f_name;
  final String l_name;
  final String iot;
  User_register({
    required this.user,
    required this.pass,
    required this.f_name,
    required this.l_name,
    required this.iot,
  });

  User_register copyWith({
    String? user,
    String? pass,
    String? f_name,
    String? l_name,
    String? iot,
  }) {
    return User_register(
      user: user ?? this.user,
      pass: pass ?? this.pass,
      f_name: f_name ?? this.f_name,
      l_name: l_name ?? this.l_name,
      iot: iot ?? this.iot,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'pass': pass,
      'f_name': f_name,
      'l_name': l_name,
      'iot': iot,
    };
  }

  factory User_register.fromMap(Map<String, dynamic> map) {
    return User_register(
      user: map['user'] as String,
      pass: map['pass'] as String,
      f_name: map['f_name'] as String,
      l_name: map['l_name'] as String,
      iot: map['iot'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User_register.fromJson(String source) =>
      User_register.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User_register(user: $user, pass: $pass, f_name: $f_name, l_name: $l_name, iot: $iot)';
  }

  @override
  bool operator ==(covariant User_register other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.pass == pass &&
        other.f_name == f_name &&
        other.l_name == l_name &&
        other.iot == iot;
  }

  @override
  int get hashCode {
    return user.hashCode ^
    pass.hashCode ^
    f_name.hashCode ^
    l_name.hashCode ^
    iot.hashCode;
  }
}
