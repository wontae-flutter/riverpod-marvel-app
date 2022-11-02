import 'dart:convert';
import 'dart:ui';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_app/providers/provider_configuration.dart';
import "../models/model_configuration/configuration.dart";
import "../models/model_marvel/marvel.dart";

//? 성능개선을 위함
final dioProvider = Provider((ref) => Dio());

//! repository에서 _getCurrentTimeStamp 함수 없앴음!! 필요없는거같아서
class MarvelRepository {
  final Ref ref;
  // final int Function() _getCurrentTimeStamp;
  final _characterCacheMap = <String, Character>{};

  MarvelRepository(
    this.ref,
  );

  Future<MarvelResponse> _get(
    String path, {
    Map<String, Object?>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    final configs = await ref.watch(configurationsProvider.future);
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = md5
        .convert(
          utf8.encode('$timestamp${configs.privateKey}${configs.publicKey}'),
        )
        .toString();
    final result = await ref.watch(dioProvider).get<Map<String, Object?>>(
        'https://gateway.marvel.com/v1/public/$path',
        cancelToken: cancelToken,
        queryParameters: <String, Object?>{
          "apikey": configs.publicKey,
          "ts": timestamp,
          "hash": hash,
          ...?queryParameters
        });
    return MarvelResponse.fromJson(Map<String, Object?>.from(result.data!));
  }

  Future<MarvelListCharactersResponse> fetchAllCharacters({
    required int offset,
    int? limit,
    String? nameStartsWith,
    CancelToken? cancelToken,
  }) async {
    final cleanNameFilter = nameStartsWith?.trim();

    final response = await _get("characters",
        queryParameters: <String, Object?>{
          "offset": offset,
          if (limit != null) "limit": limit,
          if (cleanNameFilter != null && cleanNameFilter.isNotEmpty)
            "nameStartsWith": cleanNameFilter
        },
        cancelToken: cancelToken);

    final result = MarvelListCharactersResponse(
      characters: response.data.results.map((result) {
        return Character.fromJson(result);
      }).toList(growable: false),
      totalCount: response.data.total,
    );

    for (final character in result.characters) {
      _characterCacheMap[character.id.toString()] = character;
    }

    return result;
  }

  Future<Character> fetchCharacter(String id,
      {CancelToken? cancelToken}) async {
    //* 이전에 받아왔다면 다시 요청을 하지는 말자, 그래서 캐싱을 해 놓는 것이다.
    if (_characterCacheMap.containsKey(id)) {
      return _characterCacheMap[id]!;
    }

    final response = await _get("character/$id", cancelToken: cancelToken);
    return Character.fromJson(response.data.results.single);
  }
}
