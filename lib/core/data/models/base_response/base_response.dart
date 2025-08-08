import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class BaseResponse<T> {
  final T? meals;
  final BaseResponseError? error;

  BaseResponse({this.meals, this.error});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseFromJson(json, fromJsonT);
}

@JsonSerializable(createToJson: false)
class BaseResponseError {
  final String? message;
  final String? stack;
  BaseResponseError({required this.stack, required this.message});

  factory BaseResponseError.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseErrorFromJson(json);
}
