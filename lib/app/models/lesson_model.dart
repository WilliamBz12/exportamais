class LessonModel {
  String title;
  String description;
  String image;
  int finishedLesson;
  int allLesson;

  LessonModel({
    this.title,
    this.description,
    this.image,
    this.finishedLesson,
    this.allLesson,
  });

  LessonModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    finishedLesson = json['finished_lesson'];
    allLesson = json['all_lesson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['finished_lesson'] = this.finishedLesson;
    data['all_lesson'] = this.allLesson;
    return data;
  }
}
