import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';


part 'authentication.g.dart';

@immutable
@JsonSerializable()
class Authentication extends Equatable {
  const Authentication({
    required this.{{token_field.camelCase()}},
    required this.{{refresh_token_field.camelCase()}},
  });

  final String {{token_field.camelCase()}};
  final String {{refresh_token_field.camelCase()}};

  static Authentication fromJson(Map<String, dynamic> json) =>
      _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);

  @override
  List<Object> get props {
    return [
      {{token_field.camelCase()}},
      {{refresh_token_field.camelCase()}},
    ];
  }
}
