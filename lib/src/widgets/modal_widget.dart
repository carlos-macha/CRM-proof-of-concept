import 'package:flutter/material.dart';

class ModalWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget>? actions;

  const ModalWidget({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      content: content,
      actions:
          actions ??
          [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }

  static Future<void> show(
    BuildContext context, {
    required String title,
    required Widget content,
    List<Widget>? actions,
  }) {
    return showDialog(
      context: context,
      builder: (_) =>
          ModalWidget(title: title, content: content, actions: actions),
    );
  }
}
