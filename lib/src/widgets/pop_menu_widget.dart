import 'package:flutter/material.dart';

class PopMenuWidget extends StatelessWidget {
  final List<PopupMenuEntry> items;
  final void Function(dynamic)? onSelected;
  final Icon icon;

  const PopMenuWidget({
    super.key,
    required this.items,
    this.onSelected,
    this.icon = const Icon(Icons.more_vert),
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon,
      onSelected: onSelected,
      itemBuilder: (context) => items,
    );
  }
}