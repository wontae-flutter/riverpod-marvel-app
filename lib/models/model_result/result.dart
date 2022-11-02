import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
//* 직렬화가 필요 하지 않은 모델

@freezed
class Result<T> with _$Result<T> {
  Result._();
  factory Result.data(T value) = _ResultData<T>;
  factory Result.error(Object error, [StackTrace? stackTrace]) =
      _ResultError<T>;

  factory Result.guard(T Function() callback) {
    try {
      return Result.data(callback());
    } catch (err, stack) {
      return Result.error(err, stack);
    }
  }

  static Future<Result<T>> guardFuture<T>(Future<T> Function() callback) async {
    try {
      return Result.data(await callback());
    } catch (err, stack) {
      return Result.error(err, stack);
    }
  }

  Result<Res> chain<Res>(Res Function(T value) cb) {
    return when(
      data: (value) {
        try {
          return Result.data(cb(value));
        } catch (err, stack) {
          return Result.error(err, stack);
        }
      },
      error: Result.error,
    );
  }

  T get dataOrThrow {
    return when(
      data: (value) => value,
      error: (err, stack) {
        // ignore: only_throw_errors
        throw err;
      },
    );
  }
}
