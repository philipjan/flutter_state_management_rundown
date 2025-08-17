// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(TodoListNotifier)
const todoListNotifierProvider = TodoListNotifierProvider._();

final class TodoListNotifierProvider
    extends $NotifierProvider<TodoListNotifier, TodoList> {
  const TodoListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoListNotifierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoListNotifierHash();

  @$internal
  @override
  TodoListNotifier create() => TodoListNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodoList value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodoList>(value),
    );
  }
}

String _$todoListNotifierHash() => r'71ce9e3ea6c0682cb0656c4355d2c086cbe8aed6';

abstract class _$TodoListNotifier extends $Notifier<TodoList> {
  TodoList build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TodoList, TodoList>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TodoList, TodoList>,
              TodoList,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
