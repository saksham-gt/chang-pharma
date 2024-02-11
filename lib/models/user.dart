// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:changpharma/models/default_meal_time.dart';

class User {
  String uid;
  String? name;
  int? age;
  String mobile;
  DefaultMealTime? defaultMealTime;
  bool enableReminder;
  User({
    required this.uid,
    this.name,
    this.age,
    required this.mobile,
    this.defaultMealTime,
    this.enableReminder = true,
  });

  User copyWith({
    String? uid,
    String? name,
    int? age,
    String? mobile,
    DefaultMealTime? defaultMealTime,
    bool enableReminder = true,
  }) {
    return User(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      age: age ?? this.age,
      mobile: mobile ?? this.mobile,
      defaultMealTime: defaultMealTime ?? this.defaultMealTime,
      enableReminder: enableReminder ?? this.enableReminder,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'age': age,
      'mobile': mobile,
      'defaultMealTime': defaultMealTime?.toMap(),
      'enableReminder': enableReminder,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      name: map['name'] as String,
      age: map['age'] as int,
      mobile: map['mobile'] as String,
      enableReminder: map['enableReminder'] as bool,
      defaultMealTime: DefaultMealTime.fromMap(
          map['defaultMealTime'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, age: $age, mobile: $mobile, defaultMealTime: $defaultMealTime, enableReminder: $enableReminder)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.age == age &&
        other.mobile == mobile &&
        other.enableReminder == enableReminder &&
        other.defaultMealTime == defaultMealTime;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        age.hashCode ^
        mobile.hashCode ^
        enableReminder.hashCode ^
        defaultMealTime.hashCode;
  }
}
