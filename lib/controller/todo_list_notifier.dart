
import 'package:cubitbloc/model/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list_notifier.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  TodoList build() {
    return TodoList(todos: []);
  }

  void add(String title) {
    var newTodo = Todo(title: title);
    state = state.copyWith(todos: [...state.todos, newTodo]);
  }

  void delete(int index) {
    final modifiableTodos = [...state.todos];
    modifiableTodos.removeAt(index);
    state = state.copyWith(todos: [...modifiableTodos]);
  }
}