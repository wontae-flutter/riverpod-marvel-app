import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:marvel_app/providers/provider_character.dart';

import '../models/model_character/character.dart';
import '../widgets/loading_image.dart';

class CharacterView extends HookConsumerWidget {
  const CharacterView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCharacterId = ref.watch(selectedCharacterIdProvider);

    return ref.watch(characterProvider(selectedCharacterId)).when(
      data: (character) {
        return Scaffold(
          appBar: AppBar(
            title: Text(character.name),
          ),
          body: LoadingImage(url: character.thumbnail.url),
        );
      },
      error: (err, stack) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
        );
      },
      loading: () {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
