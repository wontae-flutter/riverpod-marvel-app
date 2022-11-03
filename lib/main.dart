import 'package:flutter/material.dart';
import "package:flutter_portal/flutter_portal.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_app/providers/provider_character.dart';

import "./screens/screen_home.dart";
import "./screens/screen_character_detail.dart";

void main() {
  runApp(ProviderScope(
    child: Portal(
      child: const MyApp(),
    ),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      builder: (context, child) {
        return _Unfocus(child: child!);
      },
      //* Floating Overlay
      home: const Portal(child: Home()),
      //* 꼭 이렇게 해야되냐
      //! 여기가 하나도 안되어있네...
      onGenerateRoute: (settings) {
        if (settings.name == null) {
          return null;
        }
        final split = settings.name!.split('/');
        //*  /characters/ 뒤에 뭐가 오는지가 중요함
        Widget? result;

        if (result == null) {
          return null;
        }

        if (settings.name!.startsWith("/characters/") && split.length == 3) {
          result = ProviderScope(
            overrides: [
              selectedCharacterIdProvider.overrideWithValue(split.last)
            ],
            child: const CharacterView(),
          );
        }

        return MaterialPageRoute(builder: (context) => result!);
      },
      routes: {
        "/character": (context) => const CharacterView(),
        //! 여기에 "/characters/id" 가 설정이 안되어있어서 그래, 요걸 주면 해결이 된다
      },
    );
  }
}

//? 이게 뭔데?
class _Unfocus extends HookConsumerWidget {
  final Widget child;
  const _Unfocus({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
