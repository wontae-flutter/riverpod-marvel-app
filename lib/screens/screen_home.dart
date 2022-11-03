import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/model_character/character.dart';
import '../providers/provider_character.dart';
import '../widgets/marvel_logo.dart';
import '../widgets/loading_image.dart';
import "../widgets/search_bar.dart";

class Home extends HookConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //* characterPagination에 ""이 들어감, 페이지네이션이 기본값이라는 것
    return ref.watch(charactersCountProvider('')).when(
          data: (charactersCount) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      title: SizedBox(
                        height: 40,
                        child: marvelLogo,
                      ),
                      centerTitle: true,
                      background: Image.asset(
                        "assets/marvel_background.jpeg",
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.multiply,
                        color: Colors.grey.shade500,
                      ),
                      titlePadding: const EdgeInsetsDirectional.only(bottom: 8),
                    ),
                    actions: const [
                      //! 왜 에러가 발생하죠?
                      SearchBar(),
                    ],
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 10, left: 3, right: 3),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: charactersCount,
                        (context, index) {
                          return ProviderScope(
                            overrides: [
                              errorSpewingCharacterIndexProvider
                                  .overrideWithValue(index)
                            ],
                            child: const CharacterItem(),
                            //* overrides to change the behavior of some providers. This can be useful for testing purposes:
                            //* 그래서 일부러 오류를 발생시키는 것
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () =>
                    Navigator.pushNamed(context, '/characters/1009368'),
                label: const Text('Deep link to Iron-man'),
                icon: const Icon(Icons.link),
              ),
            );
          },
          error: (error, stack) {
            return Scaffold(
              appBar: AppBar(title: const Text("Error")),
              body: Center(child: Text("$error")),
            );
          },
          loading: () => Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              )),
        );
  }
}

class CharacterItem extends HookConsumerWidget {
  const CharacterItem({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(errorSpewingCharacterIndexProvider);

    //* 에러가 아니었어 내가 여기에 아무것도 안했구나...
    return ref
        .watch(characterAtIndexProvider(CharacterOffset(offset: index)))
        .when(
          data: (characterAtIndex) {
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, "/characters/${characterAtIndex.id}");
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Hero(
                          tag: 'character-${characterAtIndex.id}',
                          child:
                              LoadingImage(url: characterAtIndex.thumbnail.url),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(characterAtIndex.name),
                      )
                    ],
                  ),
                ));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('Error $err'),
        );
  }
}

//* 서치바가 안되어있음.......