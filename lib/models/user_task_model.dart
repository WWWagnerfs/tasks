class TaskModel {
  String id;
  String title;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}
