class Courses {
  String? name;
  String? teacher;
  String? lessons;
  String? id;
  String? imageURL;


  Courses(this.name, this.teacher, this.lessons, this.id, this.imageURL); // Map<String, dynamic> toJson() {
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
    imageURL=json['imageURL'];
  }
}
