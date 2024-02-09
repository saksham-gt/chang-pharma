// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DefaultMealTime {
  final DateTime breakfast;
  final DateTime lunch;
  final DateTime dinner;
  DefaultMealTime({
    required this.breakfast,
    required this.lunch,
    required this.dinner,
  });

  DefaultMealTime copyWith({
    DateTime? breakfast,
    DateTime? lunch,
    DateTime? dinner,
  }) {
    return DefaultMealTime(
      breakfast: breakfast ?? this.breakfast,
      lunch: lunch ?? this.lunch,
      dinner: dinner ?? this.dinner,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'breakfast': breakfast.millisecondsSinceEpoch,
      'lunch': lunch.millisecondsSinceEpoch,
      'dinner': dinner.millisecondsSinceEpoch,
    };
  }

  factory DefaultMealTime.fromMap(Map<String, dynamic> map) {
    return DefaultMealTime(
      breakfast: DateTime.fromMillisecondsSinceEpoch(map['breakfast'] as int),
      lunch: DateTime.fromMillisecondsSinceEpoch(map['lunch'] as int),
      dinner: DateTime.fromMillisecondsSinceEpoch(map['dinner'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory DefaultMealTime.fromJson(String source) =>
      DefaultMealTime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DefaultMealTime(breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';

  @override
  bool operator ==(covariant DefaultMealTime other) {
    if (identical(this, other)) return true;

    return other.breakfast == breakfast &&
        other.lunch == lunch &&
        other.dinner == dinner;
  }

  @override
  int get hashCode => breakfast.hashCode ^ lunch.hashCode ^ dinner.hashCode;
}
