// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Medicine {
  final String medicineId;
  final String label;
  final MedicineType medicineType;
  final int quantity;
  final DateTime time;
  final int totalDats;
  Medicine({
    required this.medicineId,
    required this.label,
    required this.quantity,
    required this.time,
    required this.totalDats,
    required this.medicineType,
  });

  Medicine copyWith({
    String? medicineId,
    String? label,
    int? quantity,
    DateTime? time,
    int? totalDats,
    MedicineType? medicineType,
  }) {
    return Medicine(
      medicineId: medicineId ?? this.medicineId,
      label: label ?? this.label,
      quantity: quantity ?? this.quantity,
      time: time ?? this.time,
      totalDats: totalDats ?? this.totalDats,
      medicineType: medicineType ?? this.medicineType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicineId': medicineId,
      'label': label,
      'quantity': quantity,
      'time': time.millisecondsSinceEpoch,
      'totalDats': totalDats,
      'medicineType': medicineType.name,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      medicineId: map['medicineId'] as String,
      label: map['label'] as String,
      quantity: map['quantity'] as int,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      totalDats: map['totalDats'] as int,
      medicineType: MedicineType.fromName(map['medicineType'])
          ? MedicineType.tablet
          : MedicineType.liquid,
    );
  }

  String toJson() => json.encode(toMap());

  factory Medicine.fromJson(String source) =>
      Medicine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Medicine(medicineId: $medicineId, label: $label, quantity: $quantity, time: $time, totalDats: $totalDats, medicineType: $medicineType)';
  }

  @override
  bool operator ==(covariant Medicine other) {
    if (identical(this, other)) return true;

    return other.medicineId == medicineId &&
        other.label == label &&
        other.quantity == quantity &&
        other.time == time &&
        other.totalDats == totalDats;
  }

  @override
  int get hashCode {
    return medicineId.hashCode ^
        label.hashCode ^
        quantity.hashCode ^
        time.hashCode ^
        totalDats.hashCode;
  }
}

enum MedicineType {
  tablet('tablet'),
  liquid('liquid');

  final String name;
  const MedicineType(this.name);

  static fromName(String name) {
    if (name == 'tablet') {
      return MedicineType.tablet;
    } else {
      return MedicineType.liquid;
    }
  }
}
