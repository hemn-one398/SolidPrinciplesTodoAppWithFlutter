import '../../models/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
  Future<void> addTodo(Todo todo);
  Future<void> updateTodoStatus(Todo todo);
  Future<void> deleteTodo(Todo todo);
}
