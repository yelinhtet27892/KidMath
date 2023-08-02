class Score {
  int? id;
  String? name;
  int? correctMark;
  int? article;
  String? category;

  Score(
    this.id,
    this.correctMark,
    this.article,
    this.category,
    this.name,
  );
  Score.withoutId(this.correctMark, this.article, this.category, this.name);

  Score.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    correctMark = map['correctMark'];
    article = map['article'];
    category = map['category'];
    name = map['name'];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "correctMark": correctMark,
        "article": article,
        "category": category,
        "name" : name,
      };
}
