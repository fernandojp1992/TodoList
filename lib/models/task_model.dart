  final String tableTask = 'tasks';

class TaskFields {
  static final String id = '_id';
  static final String title = 'title';
  static final String status = 'status';
  static final String description= 'description';
}
class Task {
  int? id;
  String? title;
  int? status;
  String? description;

  Task({this.title, this.status, this.description});

}