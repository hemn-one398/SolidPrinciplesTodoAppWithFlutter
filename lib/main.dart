import 'package:flutter/material.dart';
import 'package:solidprinciplesproject/app/view/todo_list_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      title: 'Todo List with solid principles',
      home: const TodoListScreen(),
    );
  }
}
