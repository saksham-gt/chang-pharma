// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Medicine {
  final String? medicineId;
  final String? drug;
  final String? form;
  final String? dosage;
  final String? frequency;
  final int? duration;
  final DateTime? time;
  final int? totalDats;
  Medicine({
    this.medicineId,
    this.drug,
    this.dosage,
    this.time,
    this.frequency,
    this.duration,
    this.totalDats,
    this.form,
  });

  Medicine copyWith({
    String? medicineId,
    String? drug,
    String? dosage,
    String? frequency,
    int? duration,
    DateTime? time,
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
      'totalDats': totalDats,
      'form': form,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    final regex = RegExp(r'\b\d+\b');
    final match = regex.firstMatch(map['duration'] ?? '');
    int? duration;
    if (match != null) {
      duration = int.parse(match.group(0)!);
    }
    return Medicine(
      medicineId: map['medicineId'] as String?,
      drug: map['drug'] as String?,
      dosage: map['dosage'] as String?,
      frequency: map['frequency'] as String?,
      duration: duration,
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
