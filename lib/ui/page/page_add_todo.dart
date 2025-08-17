import 'package:cubitbloc/controller/todo_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final textControllerProvider = Provider.autoDispose((ref) => TextEditingController());


class AddTodoScreen extends ConsumerWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = ref.watch(textControllerProvider);
    final todoListNotifier = ref.watch(todoListNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
            ),
            SizedBox(height: 24),
            OutlinedButton(onPressed: () {
              String content = textEditingController.text;
              todoListNotifier.add(content);
              context.pop();
            }, child: Text("Add TODO"))
          ],
        ),
      ),
    );
  }
}