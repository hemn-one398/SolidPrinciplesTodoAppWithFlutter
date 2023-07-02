import '../../models/todo.dart';
import 'todo_repository.dart';

class FromApiTodoRepository implements TodoRepository {
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
 
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
  
  }
}
