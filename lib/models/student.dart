class Student {
  final int? id;
  final String name;
  final String course;

  Student({this.id, required this.name, required this.course});

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(id: map['id'], name: map['name'], course: map['course']);
  }
}
