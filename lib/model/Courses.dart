class Courses {
  String? name;
  String? teacher;
  String? lessons;
  String? id;

  Courses({this.name, this.id, this.teacher, this.lessons});

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['teacher'] = this.teacher;
  //   data['lessons'] = this.lessons;
  //   return data;
  // }

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    teacher = json['teacher'];
    lessons=json['lessons'];
  }
}
