import 'package:flutter/material.dart';
import "package:flutter_hooks/flutter_hooks.dart";
import 'package:flutter_portal/flutter_portal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_app/models/model_character/character.dart';

import "../providers/provider_character.dart";
import '../screens/screen_home.dart';

//! 요거 하나 남았다!

class _SearchTheme {
  final double width;
  final double height;
  final BoxDecoration searchDecoration;
  final EdgeInsets iconPadding;
  final EdgeInsets searchMargin;

  const _SearchTheme({
    required this.width,
    this.height = 300,
    required this.searchDecoration,
    required this.iconPadding,
    required this.searchMargin,
  });
}

const _kFocusedTheme = _SearchTheme(
  width: 210,
  searchDecoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  iconPadding: EdgeInsets.only(right: 8),
  searchMargin: EdgeInsets.only(right: 10),
);

const _kUnfocusedTheme = _SearchTheme(
  width: 40,
  searchDecoration: BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  iconPadding: EdgeInsets.zero,
  searchMargin: EdgeInsets.only(right: 10),
);

//* Riverpod comes in
class SearchBar extends HookConsumerWidget {
  const SearchBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //? Whether the widget is focused of not determines if the widget is currently "searching" or idle.
    final searchFocusNode = useFocusNode();
    useListenable(searchFocusNode);
    final theme = searchFocusNode.hasFocus ? _kFocusedTheme : _kUnfocusedTheme;

    final textFocusNode = useFocusNode();
    final textEditingController = useTextEditingController();

    final hints = TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: searchFocusNode.hasFocus ? 1 : 0),
      duration: const Duration(milliseconds: 150),
      builder: (context, opacity, child) => Opacity(
        opacity: opacity,
        child: child,
      ),
      child: _SearchHintContainer(
        theme: theme,
        child: _SearchHints(textEditingController: textEditingController),
      ),
    );

    final searchField = _SearchBarView(
      theme: theme,
      isFocused: searchFocusNode.hasFocus,
      textEditingController: textEditingController,
      textFocusNode: textFocusNode,
    );

    return Focus(
      focusNode: searchFocusNode,
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: theme.width),
        duration: const Duration(milliseconds: 150),
        builder: (context, width, _) => Center(
          child: SizedBox(
            width: width,
            //* PortalEntry => PortalTarget으로 변함
            child: PortalTarget(
              visible: width > 40 || searchFocusNode.hasFocus,
              anchor: const Aligned(
                target: Alignment.bottomCenter,
                follower: Alignment.topCenter,
              ),
              portalFollower: SizedBox(width: width, child: hints),
              child: searchField,
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchHints extends HookConsumerWidget {
  final TextEditingController textEditingController;

  const _SearchHints({
    super.key,
    required this.textEditingController,
  });

  //! characterAtIndex 가 되었구
  //! charactersCount 가 되었다
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = useValueListenable(textEditingController).text;

    return ref.watch(charactersCountProvider(search)).when(
          data: (count) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(height: 0);
              },
              shrinkWrap: true,
              itemCount: count,
              itemBuilder: (context, index) {
                //* 굳이 Consumer를 사용하는 이유는 최적화가 가능하기때문이다
                return HookConsumer(
                  builder: (context, ref, child) {
                    final character =
                        ref.watch(characterAtIndexProvider(CharacterOffset(
                      offset: index,
                      name: search,
                    )));

                    return character.when(
                      data: (character) {
                        return ListTile(
                          visualDensity: VisualDensity.compact,
                          onTap: () {
                            Navigator.pushNamed(
                                context, "/characters/${character.id}");
                          },
                          title: Text(
                            character.name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      },
                      error: (err, stack) => Center(child: Text("$err")),
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                );
              },
            );
          },
          loading: () => const Center(
            heightFactor: 1,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, stackTrace) => const Center(child: Text('Error')),
        );
  }
}

class _SearchHintContainer extends StatelessWidget {
  final _SearchTheme theme;
  final Widget child;
  const _SearchHintContainer({
    super.key,
    required this.theme,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: theme.height,
      ),
      margin: theme.searchMargin,
      child: Material(
        elevation: 16,
        borderRadius: theme.searchDecoration.borderRadius,
        clipBehavior: Clip.hardEdge,
        child: OverflowBox(
          alignment: Alignment.topLeft,
          maxHeight: theme.height,
          maxWidth: 300,
          child: child,
        ),
      ),
    );
  }
}

class _SearchBarView extends StatelessWidget {
  final _SearchTheme theme;
  final bool isFocused;
  final TextEditingController textEditingController;
  final FocusNode textFocusNode;

  const _SearchBarView({
    super.key,
    required this.theme,
    required this.isFocused,
    required this.textEditingController,
    required this.textFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          //* Don't unfocus when tapping the searchbar
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: theme.width,
            height: 35,
            margin: theme.searchMargin,
            decoration: theme.searchDecoration,
          ),
        ),
        Positioned.fill(
          left: 12,
          right: 50,
          child: ExcludeSemantics(
            excluding: !isFocused,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                focusNode: textFocusNode,
                controller: textEditingController,
                scrollController: ScrollController(),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Iron man",
                ),
              ),
            ),
          ),
        ),
        AnimatedTheme(
          // data specifies the color and typography values for descendant widgets.
          data: isFocused ? ThemeData.light() : ThemeData.dark(),
          child: AnimatedPadding(
            duration: const Duration(milliseconds: 150),
            padding: theme.iconPadding,
            child: IconButton(
              icon: const Icon(Icons.search),
              tooltip: "Search by name",
              onPressed: textFocusNode.requestFocus,
            ),
          ),
        )
      ],
    );
  }
}
