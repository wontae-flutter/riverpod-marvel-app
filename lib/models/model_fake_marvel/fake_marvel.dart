import 'package:freezed_annotation/freezed_annotation.dart';

part 'fake_marvel.freezed.dart';
//* 직렬화가 필요 하지 않은 모델

@freezed
class Result<T> with _$Result<T> {}
