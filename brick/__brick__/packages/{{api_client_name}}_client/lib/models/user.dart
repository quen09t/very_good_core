import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@immutable
@JsonSerializable()
class User extends Equatable {
  const User({
    required this.email,
  });

  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  final String email;

  User copyWith({
    String? email,
  }) {
    return User(
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props {
    return [
      email,
    ];
  }
}
