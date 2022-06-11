class UserModel {
  String? sId;
  String? name;
  String? username;
  String? photo;
  String? token;

  UserModel({this.sId, this.name, this.username, this.photo, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    username = json['username'];
    photo = json['photo'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['username'] = username;
    data['photo'] = photo;
    data['token'] = token;
    return data;
  }
}
