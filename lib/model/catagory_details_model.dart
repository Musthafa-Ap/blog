class CatagoryDetailsModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  CatagoryDetailsModel({this.count, this.next, this.previous, this.results});

  CatagoryDetailsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  int? id;
  String? createdAt;
  String? image;
  String? title;
  String? content;
  int? category;

  Results(
      {this.id,
      this.createdAt,
      this.image,
      this.title,
      this.content,
      this.category});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    image = json['image'];
    title = json['title'];
    content = json['content'];
    category = json['category'];
  }
}
