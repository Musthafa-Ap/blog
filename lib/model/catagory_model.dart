class CatagoryModel {
  bool? status;
  List<BlogsCategory>? blogsCategory;

  CatagoryModel({this.status, this.blogsCategory});

  CatagoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['blogs_category'] != null) {
      blogsCategory = <BlogsCategory>[];
      json['blogs_category'].forEach((v) {
        blogsCategory!.add(BlogsCategory.fromJson(v));
      });
    }
  }
}

class BlogsCategory {
  int? id;
  String? name;

  BlogsCategory({this.id, this.name});

  BlogsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
