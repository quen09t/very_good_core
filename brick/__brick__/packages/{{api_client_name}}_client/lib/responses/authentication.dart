import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';


part 'authentication.g.dart';

@immutable
@JsonSerializable()
class Authentication extends Equatable {
  const Authentication({
    required this.{{#camelCase}}{{token_field}}{{/camelCase}},
    required this.{{#camelCase}}{{refresh_token_field}}{{/camelCase}},
  });

  final String {{#camelCase}}{{token_field}}{{/camelCase}};
  final String {{#camelCase}}{{refresh_token_field}}{{/camelCase}};

  static Authentication fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);

  @override
  List<Object> get props {
    return [
      {{#camelCase}}{{token_field}}{{/camelCase}},
      {{#camelCase}}{{refresh_token_field}}{{/camelCase}},
    ];
  }
}
