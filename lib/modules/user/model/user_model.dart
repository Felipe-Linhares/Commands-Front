class UserModel {
  int? id;
  String? email;
  String? name;
  String? lastname;
  String? password;
  String? image;

  UserModel({this.email, this.name, this.lastname, this.password, this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    lastname = json['lastname'];
    password = json['password'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['lastname'] = lastname;
    data['password'] = password;
    data['image'] = image;
    return data;
  }
}
