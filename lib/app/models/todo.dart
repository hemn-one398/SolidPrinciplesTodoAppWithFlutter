class Todo {
  final String id;
  String title;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  // Getter for the title
  String get getTitle => title;

  // Setter for the title
  set setTitle(String newTitle) => title = newTitle;

  // Getter for isCompleted
  bool get getIsCompleted => isCompleted;

  // Setter for isCompleted
  set setIsCompleted(bool newIsCompleted) => isCompleted = newIsCompleted;
}
