import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/loading_image.dart';
import '../widgets/marvel_logo.dart';

//? charactersCount가 search_bar.dart, screen_home.dart에서 서로서로 의존하는데?
//? provider로 빼놔야 하는게 아닌가?
class Home extends HookConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
