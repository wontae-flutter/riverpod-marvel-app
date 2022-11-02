library marvel;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'marvel.freezed.dart';
part 'marvel.g.dart';

@freezed
class MarvelListCharactersResponse with _$MarvelListCharactersResponse {
  factory MarvelListCharactersResponse({
    required int totalCount,
    required List<Character> characters,
  }) = _MarvelListCharactersResponse;
}

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
class MarvelResponse with _$MarvelResponse {
  factory MarvelResponse(MarvelData data) = _MarvelResponse;

  factory MarvelResponse.fromJson(Map<String, Object?> json) =>
      _$MarvelResponseFromJson(json);
}

@freezed
class MarvelData with _$MarvelData {
  factory MarvelData(
    List<Map<String, Object?>> results,
    int total,
  ) = _MarvelData;

  factory MarvelData.fromJson(Map<String, Object?> json) =>
      _$MarvelDataFromJson(json);
}
