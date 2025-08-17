import 'package:cubitbloc/controller/todo_list_notifier.dart';
import 'package:cubitbloc/route/app_router_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widget/widget_list_item.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todoList = ref.watch(todoListNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO async Riverpod"),
        centerTitle: true,
      ),
      body: Center(
        child: todoList.todos.isEmpty
            ? Text("Empty TODO")
            : ListView.builder(
                itemCount: todoList.todos.length,
                itemBuilder: (ctx, index) =>
                    GestureDetector(
                      onLongPress: () {
                        _showMenu(context, ref, index);
                      },
                      child: TodoItem(
                        key: Key(index.toString()),
                        todoDescription: todoList.todos[index].title,
                      ),
                    ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RouterConst.addTodoPath);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

void _showMenu(BuildContext context, WidgetRef ref, int index) async {
  var todoListNotifier = ref.read(todoListNotifierProvider.notifier);
  final RenderBox item = context.findRenderObject() as RenderBox;
  final RenderBox overlay = Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;

  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      item.localToGlobal(Offset.zero, ancestor: overlay),
      item.localToGlobal(item.size.bottomRight(Offset.zero), ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  await showMenu(
    position: position,
    context: context,
    items: [
      PopupMenuItem(
        child: Text("Delete"),
        onTap: () {
          todoListNotifier.delete(index);
        },
      )
    ],
  );
}