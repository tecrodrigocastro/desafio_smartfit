// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Schedules {
  final String? weekdays;
  final String? hour;
  Schedules({
    required this.weekdays,
    required this.hour,
  });

  Schedules copyWith({
    String? weekdays,
    String? hour,
  }) {
    return Schedules(
      weekdays: weekdays ?? this.weekdays,
      hour: hour ?? this.hour,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'weekdays': weekdays,
      'hour': hour,
    };
  }

  factory Schedules.fromMap(Map<String, dynamic> map) {
    return Schedules(
      weekdays: map['weekdays'] != null ? map['weekdays'] as String : null,
      hour: map['hour'] != null ? map['hour'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedules.fromJson(String source) =>
      Schedules.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Schedules(weekdays: $weekdays, hour: $hour)';

  @override
  bool operator ==(covariant Schedules other) {
    if (identical(this, other)) return true;

    return other.weekdays == weekdays && other.hour == hour;
  }

  @override
  int get hashCode => weekdays.hashCode ^ hour.hashCode;
}
