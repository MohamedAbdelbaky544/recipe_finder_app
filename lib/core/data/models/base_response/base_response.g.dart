// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: prefer_const_declarations

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map json,
  T Function(Object? json) fromJsonT,
) => BaseResponse<T>(
  meals: _$nullableGenericFromJson(json['meals'], fromJsonT),
  error: json['error'] == null
      ? null
      : BaseResponseError.fromJson(
          Map<String, dynamic>.from(json['error'] as Map),
        ),
);

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

BaseResponseError _$BaseResponseErrorFromJson(Map json) => BaseResponseError(
  stack: json['stack'] as String?,
  message: json['message'] as String?,
);
