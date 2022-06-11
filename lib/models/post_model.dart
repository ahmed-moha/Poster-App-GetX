class PostModel {
  String? sId;
  String? body;
  List<Likes>? likes;
  List<Comments>? comments;
  String? createdDate;
  String? name;
  String? photo;

  PostModel(
      {this.sId,
      this.body,
      this.likes,
      this.comments,
      this.createdDate,
      this.name,
      this.photo});

  PostModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    body = json['body'];
    if (json['likes'] != null) {
      likes = <Likes>[];
      json['likes'].forEach((v) {
        likes!.add(Likes.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    createdDate = json['created_date'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['body'] = body;
    if (likes != null) {
      data['likes'] = likes!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['created_date'] = createdDate;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}

class Likes {
  String? type;
  String? sId;
  String? createdDate;
  String? name;
  String? photo;

  Likes({this.type, this.sId, this.createdDate, this.name, this.photo});

  Likes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sId = json['_id'];
    createdDate = json['created_date'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['_id'] = sId;
    data['created_date'] = createdDate;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}

class Comments {
  String? body;
  String? sId;
  String? createdDate;
  String? name;
  String? photo;

  Comments({this.body, this.sId, this.createdDate, this.name, this.photo});

  Comments.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    sId = json['_id'];
    createdDate = json['created_date'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = body;
    data['_id'] = sId;
    data['created_date'] = createdDate;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}
