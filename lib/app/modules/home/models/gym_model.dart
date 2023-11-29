// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:desafio_smartfit/app/modules/home/models/schedules_model.dart';
import 'package:flutter/foundation.dart';

class GymModel {
  final int id;
  final String? title;
  final String? content;
  final bool? opened;
  final String? mask;
  final String? towel;
  final String? fountain;
  final String? locker_room;
  final List<Schedules>? schedules;
  GymModel({
    required this.id,
    required this.title,
    required this.content,
    required this.opened,
    required this.mask,
    required this.towel,
    required this.fountain,
    required this.locker_room,
    required this.schedules,
  });

  GymModel copyWith({
    int? id,
    String? title,
    String? content,
    bool? opened,
    String? mask,
    String? towel,
    String? fountain,
    String? locker_room,
    List<Schedules>? schedules,
  }) {
    return GymModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      opened: opened ?? this.opened,
      mask: mask ?? this.mask,
      towel: towel ?? this.towel,
      fountain: fountain ?? this.fountain,
      locker_room: locker_room ?? this.locker_room,
      schedules: schedules ?? this.schedules,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'opened': opened,
      'mask': mask,
      'towel': towel,
      'fountain': fountain,
      'locker_room': locker_room,
      'schedules': schedules!.map((x) => x.toMap()).toList(),
    };
  }

  factory GymModel.fromMap(Map<String, dynamic> map) {
    return GymModel(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      opened: map['opened'] != null ? map['opened'] as bool : null,
      mask: map['mask'] != null ? map['mask'] as String : null,
      towel: map['towel'] != null ? map['towel'] as String : null,
      fountain: map['fountain'] != null ? map['fountain'] as String : null,
      locker_room:
          map['locker_room'] != null ? map['locker_room'] as String : null,
      schedules: map['schedules'] != null
          ? List<Schedules>.from(
              (map['schedules'] as List<dynamic>).map<Schedules?>(
                (x) => Schedules.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymModel.fromJson(String source) =>
      GymModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GymModel(id: $id, title: $title, content: $content, opened: $opened, mask: $mask, towel: $towel, fountain: $fountain, locker_room: $locker_room, schedules: $schedules)';
  }

  @override
  bool operator ==(covariant GymModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.content == content &&
        other.opened == opened &&
        other.mask == mask &&
        other.towel == towel &&
        other.fountain == fountain &&
        other.locker_room == locker_room &&
        listEquals(other.schedules, schedules);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        opened.hashCode ^
        mask.hashCode ^
        towel.hashCode ^
        fountain.hashCode ^
        locker_room.hashCode ^
        schedules.hashCode;
  }
}
