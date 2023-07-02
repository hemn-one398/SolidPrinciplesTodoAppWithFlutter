import '../../models/todo.dart';
import 'todo_repository.dart';

class InMemoryTodoRepository implements TodoRepository {
  List<Todo> todos = [];

  @override
  Future<List<Todo>> fetchTodos() async {
    return todos;
  }

  @override
  Future<void> addTodo(Todo todo) async {
    todos.add(todo);
  }

  @override
  Future<void> updateTodoStatus(Todo todo) async {
    final index = todos.indexWhere((t) => t.id == todo.id);
    if (index >= 0) {
      todos[index] = todo;
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    todos.removeWhere((t) => t.id == todo.id);
  }
}
