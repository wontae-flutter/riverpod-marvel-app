// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of marvel;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MarvelListCharactersResponse {
  int get totalCount => throw _privateConstructorUsedError;
  List<Character> get characters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarvelListCharactersResponseCopyWith<MarvelListCharactersResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelListCharactersResponseCopyWith<$Res> {
  factory $MarvelListCharactersResponseCopyWith(
          MarvelListCharactersResponse value,
          $Res Function(MarvelListCharactersResponse) then) =
      _$MarvelListCharactersResponseCopyWithImpl<$Res,
          MarvelListCharactersResponse>;
  @useResult
  $Res call({int totalCount, List<Character> characters});
}

/// @nodoc
class _$MarvelListCharactersResponseCopyWithImpl<$Res,
        $Val extends MarvelListCharactersResponse>
    implements $MarvelListCharactersResponseCopyWith<$Res> {
  _$MarvelListCharactersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? characters = null,
  }) {
    return _then(_value.copyWith(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarvelListCharactersResponseCopyWith<$Res>
    implements $MarvelListCharactersResponseCopyWith<$Res> {
  factory _$$_MarvelListCharactersResponseCopyWith(
          _$_MarvelListCharactersResponse value,
          $Res Function(_$_MarvelListCharactersResponse) then) =
      __$$_MarvelListCharactersResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCount, List<Character> characters});
}

/// @nodoc
class __$$_MarvelListCharactersResponseCopyWithImpl<$Res>
    extends _$MarvelListCharactersResponseCopyWithImpl<$Res,
        _$_MarvelListCharactersResponse>
    implements _$$_MarvelListCharactersResponseCopyWith<$Res> {
  __$$_MarvelListCharactersResponseCopyWithImpl(
      _$_MarvelListCharactersResponse _value,
      $Res Function(_$_MarvelListCharactersResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = null,
    Object? characters = null,
  }) {
    return _then(_$_MarvelListCharactersResponse(
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Character>,
    ));
  }
}

/// @nodoc

class _$_MarvelListCharactersResponse implements _MarvelListCharactersResponse {
  _$_MarvelListCharactersResponse(
      {required this.totalCount, required final List<Character> characters})
      : _characters = characters;

  @override
  final int totalCount;
  final List<Character> _characters;
  @override
  List<Character> get characters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  String toString() {
    return 'MarvelListCharactersResponse(totalCount: $totalCount, characters: $characters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarvelListCharactersResponse &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalCount,
      const DeepCollectionEquality().hash(_characters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarvelListCharactersResponseCopyWith<_$_MarvelListCharactersResponse>
      get copyWith => __$$_MarvelListCharactersResponseCopyWithImpl<
          _$_MarvelListCharactersResponse>(this, _$identity);
}

abstract class _MarvelListCharactersResponse
    implements MarvelListCharactersResponse {
  factory _MarvelListCharactersResponse(
          {required final int totalCount,
          required final List<Character> characters}) =
      _$_MarvelListCharactersResponse;

  @override
  int get totalCount;
  @override
  List<Character> get characters;
  @override
  @JsonKey(ignore: true)
  _$$_MarvelListCharactersResponseCopyWith<_$_MarvelListCharactersResponse>
      get copyWith => throw _privateConstructorUsedError;
}

MarvelResponse _$MarvelResponseFromJson(Map<String, dynamic> json) {
  return _MarvelResponse.fromJson(json);
}

/// @nodoc
mixin _$MarvelResponse {
  MarvelData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelResponseCopyWith<MarvelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelResponseCopyWith<$Res> {
  factory $MarvelResponseCopyWith(
          MarvelResponse value, $Res Function(MarvelResponse) then) =
      _$MarvelResponseCopyWithImpl<$Res, MarvelResponse>;
  @useResult
  $Res call({MarvelData data});

  $MarvelDataCopyWith<$Res> get data;
}

/// @nodoc
class _$MarvelResponseCopyWithImpl<$Res, $Val extends MarvelResponse>
    implements $MarvelResponseCopyWith<$Res> {
  _$MarvelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MarvelData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelDataCopyWith<$Res> get data {
    return $MarvelDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MarvelResponseCopyWith<$Res>
    implements $MarvelResponseCopyWith<$Res> {
  factory _$$_MarvelResponseCopyWith(
          _$_MarvelResponse value, $Res Function(_$_MarvelResponse) then) =
      __$$_MarvelResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MarvelData data});

  @override
  $MarvelDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_MarvelResponseCopyWithImpl<$Res>
    extends _$MarvelResponseCopyWithImpl<$Res, _$_MarvelResponse>
    implements _$$_MarvelResponseCopyWith<$Res> {
  __$$_MarvelResponseCopyWithImpl(
      _$_MarvelResponse _value, $Res Function(_$_MarvelResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_MarvelResponse(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MarvelData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarvelResponse implements _MarvelResponse {
  _$_MarvelResponse(this.data);

  factory _$_MarvelResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MarvelResponseFromJson(json);

  @override
  final MarvelData data;

  @override
  String toString() {
    return 'MarvelResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarvelResponse &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarvelResponseCopyWith<_$_MarvelResponse> get copyWith =>
      __$$_MarvelResponseCopyWithImpl<_$_MarvelResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarvelResponseToJson(
      this,
    );
  }
}

abstract class _MarvelResponse implements MarvelResponse {
  factory _MarvelResponse(final MarvelData data) = _$_MarvelResponse;

  factory _MarvelResponse.fromJson(Map<String, dynamic> json) =
      _$_MarvelResponse.fromJson;

  @override
  MarvelData get data;
  @override
  @JsonKey(ignore: true)
  _$$_MarvelResponseCopyWith<_$_MarvelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelData _$MarvelDataFromJson(Map<String, dynamic> json) {
  return _MarvelData.fromJson(json);
}

/// @nodoc
mixin _$MarvelData {
  List<Map<String, Object?>> get results => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelDataCopyWith<MarvelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelDataCopyWith<$Res> {
  factory $MarvelDataCopyWith(
          MarvelData value, $Res Function(MarvelData) then) =
      _$MarvelDataCopyWithImpl<$Res, MarvelData>;
  @useResult
  $Res call({List<Map<String, Object?>> results, int total});
}

/// @nodoc
class _$MarvelDataCopyWithImpl<$Res, $Val extends MarvelData>
    implements $MarvelDataCopyWith<$Res> {
  _$MarvelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object?>>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarvelDataCopyWith<$Res>
    implements $MarvelDataCopyWith<$Res> {
  factory _$$_MarvelDataCopyWith(
          _$_MarvelData value, $Res Function(_$_MarvelData) then) =
      __$$_MarvelDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, Object?>> results, int total});
}

/// @nodoc
class __$$_MarvelDataCopyWithImpl<$Res>
    extends _$MarvelDataCopyWithImpl<$Res, _$_MarvelData>
    implements _$$_MarvelDataCopyWith<$Res> {
  __$$_MarvelDataCopyWithImpl(
      _$_MarvelData _value, $Res Function(_$_MarvelData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? total = null,
  }) {
    return _then(_$_MarvelData(
      null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object?>>,
      null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarvelData implements _MarvelData {
  _$_MarvelData(final List<Map<String, Object?>> results, this.total)
      : _results = results;

  factory _$_MarvelData.fromJson(Map<String, dynamic> json) =>
      _$$_MarvelDataFromJson(json);

  final List<Map<String, Object?>> _results;
  @override
  List<Map<String, Object?>> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int total;

  @override
  String toString() {
    return 'MarvelData(results: $results, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarvelData &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarvelDataCopyWith<_$_MarvelData> get copyWith =>
      __$$_MarvelDataCopyWithImpl<_$_MarvelData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarvelDataToJson(
      this,
    );
  }
}

abstract class _MarvelData implements MarvelData {
  factory _MarvelData(
          final List<Map<String, Object?>> results, final int total) =
      _$_MarvelData;

  factory _MarvelData.fromJson(Map<String, dynamic> json) =
      _$_MarvelData.fromJson;

  @override
  List<Map<String, Object?>> get results;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$_MarvelDataCopyWith<_$_MarvelData> get copyWith =>
      throw _privateConstructorUsedError;
}
