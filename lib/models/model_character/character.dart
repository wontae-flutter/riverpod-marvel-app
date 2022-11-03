import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  factory Character({
    required int id,
    required String name,
    required Thumbnail thumbnail,
  }) = _Character;

  factory Character.fromJson(Map<String, Object?> json) =>
      _$CharacterFromJson(json);
}

@freezed
class Thumbnail with _$Thumbnail {
  factory Thumbnail({
    required String path,
    required String extension,
  }) = _Thumbnail;
  Thumbnail._();

  factory Thumbnail.fromJson(Map<String, Object?> json) =>
      _$ThumbnailFromJson(json);

  late final String url =
      '${path.replaceFirst('http://', 'https://')}.$extension';
}

@freezed
class CharacterOffset with _$CharacterOffset {
  factory CharacterOffset({
    required int offset,
    @Default('') String name,
  }) = _CharacterOffset;
}

@freezed
class CharacterPagination with _$CharacterPagination {
  factory CharacterPagination({
    required int page,
    String? name,
  }) = _CharacterPagination;
}
