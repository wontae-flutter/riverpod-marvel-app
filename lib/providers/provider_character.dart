import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/repository_character.dart';
import '../models/model_marvel/marvel.dart';
import '../models/model_character/character.dart';

//! repository가 characterrepository로 변함
//* selected Character's Id
//? [MaterialApp.onGenerateRoute], in `main.dart`, which overrides [selectedCharacterId] to set the ID based by parsing the route path.

final selectedCharacterIdProvider = Provider<String>((ref) {
  throw UnimplementedError();
});

// A provider that individually fetches a [Character] based on its ID.
final characterProvider =
    FutureProvider.autoDispose.family<Character, String>((ref, id) async {
  //* 유저가 모바일 딥링크를 이용해서 캐릭터 페이지에 도달한 상황, 때문에 캐릭터를 개별 Fetch한다

  //* Dio package: 요청이 완료되기 전에 유저가 디테일 페이지를 떠나면 요청을 취소한다
  final cancelToken = CancelToken();
  //* ref has built-in event lister
  ref.onDispose(cancelToken.cancel);

  final characterRepository = ref.watch(characterRepositoryProvider);
  final character =
      await characterRepository.fetchCharacter(id, cancelToken: cancelToken);

  //* cache the character once it was successfully obtained
  ref.keepAlive();
  return character;
});

// The catch is: When using deep-links, a user may want to see a [Character]
// without clicking on its item in the home page – in which case the [Character] wasn't obtained yet.
// In that situation, the provider will trigger an HTTP request to read that [Character] specifically.
//
// If the user leaves the detail page before the HTTP request completes,
// the request is cancelled.

// This rarely perform an HTTP request as most of the time the [Character]
// is already pre-fetched by the home page.
//! 홈페이지에 있는 프로바이더가 전체를 가져오나봐, 그것도 따로 분리하자

class AbortedException implements Exception {}

const kCharactersPageLimit = 50;

//* 페이지네이션이 적용된 전체를 다 가져온다
//! 이름 바꾸자!
final characterPagesProvider = FutureProvider.autoDispose
    .family<MarvelListCharactersResponse, CharacterPagination>(
        (ref, characterPagination) async {
  //* Cancel the page request if the UI no longer needs it before the request is finished.
  //* usaull happens when the user scrolls very fast
  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  //* Debouncing the request. By having this delay, it leaves the opportunity
  //* for consumers to subscribe to a different `characterPagination` parameters. In which
  //* case, this request will be aborted.
  await Future<void>.delayed(const Duration(milliseconds: 250));
  if (cancelToken.isCancelled) throw AbortedException();

  final characterRepository = ref.watch(characterRepositoryProvider);

  final allCharacters = await characterRepository.fetchAllCharacters(
      offset: characterPagination.page * kCharactersPageLimit,
      limit: kCharactersPageLimit,
      nameStartsWith: characterPagination.name,
      cancelToken: cancelToken);
  return allCharacters;
});

final charactersCountProvider =
    Provider.autoDispose.family<AsyncValue<int>, String>((ref, name) {
  final characterPagination = CharacterPagination(page: 0, name: name);

  return ref
      .watch(characterPagesProvider(characterPagination))
      .whenData((value) => value.totalCount);
});

//* 시작하는 곳을 말하는거 같은디....
final characterAtIndexProvider = Provider.autoDispose
    .family<AsyncValue<Character>, CharacterOffset>((ref, characterOffset) {
  final offsetInPage = characterOffset.offset % kCharactersPageLimit;
  final characterPagination = CharacterPagination(
    page: characterOffset.offset ~/ kCharactersPageLimit,
    name: characterOffset.name,
  );

  return ref
      .watch(characterPagesProvider(characterPagination))
      .whenData((value) => value.characters[offsetInPage]);
});

final errorSpewingCharacterIndexProvider =
    Provider<int>((ref) => throw UnimplementedError());
