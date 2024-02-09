// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:changpharma/models/default_meal_time.dart';

class User {
  final String uid;
  final String name;
  final int age;
  final String mobile;
  final DefaultMealTime defaultMealTime;
  User({
    required this.uid,
    required this.name,
    required this.age,
    required this.mobile,
    required this.defaultMealTime,
  });

  User copyWith({
    String? uid,
    String? name,
    int? age,
    String? mobile,
    DefaultMealTime? defaultMealTime,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      age: age ?? this.age,
      mobile: mobile ?? this.mobile,
      defaultMealTime: defaultMealTime ?? this.defaultMealTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'age': age,
      'mobile': mobile,
      'defaultMealTime': defaultMealTime.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      name: map['name'] as String,
      age: map['age'] as int,
      mobile: map['mobile'] as String,
      defaultMealTime: DefaultMealTime.fromMap(
          map['defaultMealTime'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, age: $age, mobile: $mobile, defaultMealTime: $defaultMealTime)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.age == age &&
        other.mobile == mobile &&
        other.defaultMealTime == defaultMealTime;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        age.hashCode ^
        mobile.hashCode ^
        defaultMealTime.hashCode;
  }
}
