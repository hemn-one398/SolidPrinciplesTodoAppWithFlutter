import '../models/todo.dart';
import '../repositories/todo/todo_repository.dart';

class TodoService {
  final TodoRepository repository;
  // InMemoryTodoRepository repository; // this WrongXXXXXXXXX

  TodoService(this.repository);

  Future<List<Todo>> fetchTodos() async {
    return repository.fetchTodos();
  }

  Future<void> addTodo(Todo todo) async {
    await repository.addTodo(todo);
  }

  Future<void> updateTodoStatus(Todo todo) async {
    await repository.updateTodoStatus(todo);
  }

  Future<void> deleteTodo(Todo todo) async {
    await repository.deleteTodo(todo);
  }
}
