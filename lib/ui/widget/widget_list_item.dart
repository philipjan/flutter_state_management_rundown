import 'package:flutter/material.dart';

// TODO: 8/11/25 Finalize the content
class TodoItem extends StatelessWidget {
  final String todoDescription;
  const TodoItem({super.key, required this.todoDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16
      ),
      child: Center(
        child: Text(todoDescription),
      ),
    );
  }
}
