// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class User_register {
  final String user;
  final String passd;
  final String f_name;
  final String birthday;
  final String hight;
  final String weight;
  User_register({
    required this.user,
    required this.passd,
    required this.f_name,
    required this.birthday,
    required this.hight,
    required this.weight,
  });

  User_register copyWith({
    String? user,
    String? passd,
    String? f_name,
    String? birthday,
    String? hight,
    String? weight,
  }) {
    return User_register(
      user: user ?? this.user,
      passd: passd ?? this.passd,
      f_name: f_name ?? this.f_name,
      birthday: birthday ?? this.birthday,
      hight: hight ?? this.hight,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user,
      'passd': passd,
      'f_name': f_name,
      'birthday': birthday,
      'hight': hight,
      'weight': weight,
    };
  }

  factory User_register.fromMap(Map<String, dynamic> map) {
    return User_register(
      user: map['user'] as String,
      passd: map['passd'] as String,
      f_name: map['f_name'] as String,
      birthday: map['birthday'] as String,
      hight: map['hight'] as String,
      weight: map['weight'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User_register.fromJson(String source) =>
      User_register.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User_register(user: $user, passd: $passd, f_name: $f_name, birthday: $birthday, hight: $hight, weight: $weight)';
  }

  @override
  bool operator ==(covariant User_register other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.passd == passd &&
        other.f_name == f_name &&
        other.birthday == birthday &&
        other.hight == hight &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        passd.hashCode ^
        f_name.hashCode ^
        birthday.hashCode ^
        hight.hashCode ^
        weight.hashCode;
  }
}
