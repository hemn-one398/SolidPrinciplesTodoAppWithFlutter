import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/todo_service.dart';
import '../repositories/todo/in_memory_todo_repository.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  TodoListScreenState createState() => TodoListScreenState();
}

class TodoListScreenState extends State<TodoListScreen> {
  final TodoService _todoService = TodoService(InMemoryTodoRepository());
  // final TodoService _todoService = TodoService(FromApiTodoRepository());
  final TextEditingController _textFieldController = TextEditingController();
  List<Todo> _todos = [];
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  Future<void> _fetchTodos() async {
    final todos = await _todoService.fetchTodos();
    setState(() {
      _todos = todos;
    });
  }

  Future<void> _addTodo() async {
    final title = _textFieldController.text;
    if (title.isNotEmpty) {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
      );
      await _todoService.addTodo(todo);
      _textFieldController.clear();
      _fetchTodos();
    }
  }

  Future<void> _updateTodoStatus(Todo todo) async {
    todo.isCompleted = !todo.isCompleted;
    await _todoService.updateTodoStatus(todo);
    _fetchTodos();
  }

  Future<void> _deleteTodo(Todo todo) async {
    await _todoService.deleteTodo(todo);
    _fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(todo.title),
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (_) => _updateTodoStatus(todo),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTodo(todo),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add Todo'),
              content: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(
                  hintText: 'Enter todo title',
                ),
              ),
              actions: [
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _addTodo();
                  },
                ),
              ],
            );
          },
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
