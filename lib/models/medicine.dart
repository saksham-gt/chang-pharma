// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Medicine {
  final String? medicineId;
  final String? drug;
  final String? form;
  final String? dosage;
  final String? frequency;
  final int? duration;
  final String? durationString;
  final String? strength;
  final DateTime? time;
  final int? totalDats;
  Medicine({
    this.medicineId,
    this.drug,
    this.dosage,
    this.time,
    this.frequency,
    this.duration,
    this.durationString,
    this.totalDats,
    this.strength,
    this.form,
  });

  Medicine copyWith({
    String? medicineId,
    String? drug,
    String? dosage,
    String? frequency,
    int? duration,
    DateTime? time,
    String? strength,
    int? totalDats,
    String? form,
  }) {
    return Medicine(
      medicineId: medicineId ?? this.medicineId,
      drug: drug ?? this.drug,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      duration: duration ?? this.duration,
      time: time ?? this.time,
      strength: strength ?? this.strength,
      totalDats: totalDats ?? this.totalDats,
      form: form ?? this.form,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicineId': medicineId,
      'drug': drug,
      'dosage': dosage,
      'frequency': frequency,
      'duration': duration,
      'time': time?.millisecondsSinceEpoch,
      'strength': strength,
      'totalDats': totalDats,
      'form': form,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    final regex =
        RegExp(r'\b(\d+)\s+(days|weeks|Weeks|Days|month|Months|Month)\b');
    final match = regex.firstMatch(map['duration'] ?? '');
    int? duration;
    if (match != null) {
      int number = int.parse(match.group(1)!);
      String unit = match.group(2)!;
      // duration = int.parse(match.group(0)!);
      if (unit == 'weeks' ||
          unit == 'Weeks' ||
          unit == 'Week' ||
          unit == 'week') {
        duration = number * 7; // Multiply by 7 for weeks
      } else if (unit == 'month' ||
          unit == 'Months' ||
          unit == 'Month' ||
          unit == 'months') {
        duration = number * 30;
      } else {
        duration = number;
      }
    }
    return Medicine(
      medicineId: map['medicineId'] as String?,
      drug: map['drug'] as String?,
      dosage: map['dosage'] as String?,
      frequency: map['frequency'] as String?,
      strength: map['strength'] as String?,
      duration: duration,
      durationString: map['duration'] as String?,
      time: map['time'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['time'] as int)
          : null,
      totalDats: map['totalDats'] as int?,
      form: map['form'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) =>
      Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Medicine(medicineId: $medicineId, drug: $drug, dosage: $dosage, time: $time, frequency: $frequency, duration: $duration, totalDats: $totalDats, form: $form)';
  }

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;

    return other.medicineId == medicineId &&
        other.drug == drug &&
        other.dosage == dosage &&
        other.time == time &&
        other.frequency == frequency &&
        other.duration == duration &&
        other.form == form &&
        other.strength == strength &&
        other.totalDats == totalDats;
  }

  @override
  int get hashCode {
    return medicineId.hashCode ^
        drug.hashCode ^
        dosage.hashCode ^
        time.hashCode ^
        frequency.hashCode ^
        duration.hashCode ^
        form.hashCode ^
        strength.hashCode ^
        totalDats.hashCode;
  }
}

// enum Form {
//   tablet('tablet'),
//   liquid('liquid');

//   final String name;
//   const Form(this.name);

//   static fromName(String name) {
//     if (name == 'tablet') {
//       return Form.tablet;
//     } else {
//       return Form.liquid;
//     }
//   }
// }
