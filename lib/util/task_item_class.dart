class TaskItem {
  String description;
  bool isCompleted;

  TaskItem(this.description, this.isCompleted);
  void toggleTaskCompletion() {
    isCompleted = !isCompleted;
  }
}
