class Question{
  String? id;
  String? title;
  late final Map<String, bool> options;

  Question({
    required this.id,
    required this.title,
    required this.options,
});

  @override
  String toString() {
    // TODO: implement toString
    return 'Question(id:$id, name:$title, option:$options)';
  }

}