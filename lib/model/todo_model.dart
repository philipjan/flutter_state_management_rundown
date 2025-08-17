import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
sealed class TodoList with _$TodoList {
  const factory TodoList({required List<Todo> todos}) = _TodoList;
}

@freezed
sealed class Todo with _$Todo {
  const factory Todo({required String title}) = _Todo;
}
