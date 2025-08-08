import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recipe_finder_app/core/presentation/extension/tr.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.onChanged,
    this.localSearch = false,
    this.controller,
    this.focusNode,
    this.backgroundColor,
    this.suffixIcon,
    this.searchHintText,
  });
  final bool localSearch;
  final TextEditingController? controller;
  final void Function(String) onChanged;
  final Color? backgroundColor;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final String? searchHintText;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? _debounce;
  void delayTwoSecond(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 1200),
      () => widget.onChanged(value),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      onChanged: (value) {
        if (widget.localSearch) {
          widget.onChanged(value);
        } else {
          delayTwoSecond(value);
        }
      },
      onTapOutside: (event) {
        if (widget.focusNode != null) {
          widget.focusNode!.unfocus();
        }
      },
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor:
            widget.backgroundColor ??
            Theme.of(context).inputDecorationTheme.fillColor,
        labelText: widget.searchHintText ?? context.translation.searchRecipes,
        suffixIcon: const Icon(Icons.search),
      ),
    );
  }
}
