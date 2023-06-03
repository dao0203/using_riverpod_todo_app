import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    required String email,
    required String description,
    required bool completed,
  }) = _Todo;
}