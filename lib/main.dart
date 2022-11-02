import 'package:flutter/material.dart';
import "package:flutter_hooks/flutter_hooks.dart";
import "package:flutter_portal/flutter_portal.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
