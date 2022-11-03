library marvel;

import 'package:freezed_annotation/freezed_annotation.dart';

import '../model_character/character.dart';

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

// offset을 여기에다 더해야되는거 아닌가?
