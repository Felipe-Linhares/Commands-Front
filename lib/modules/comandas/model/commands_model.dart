class CommandsModel {
  int? id;
  int? userId;
  String? name;
  String? request;
  String? note;
  String? created;

  CommandsModel(
      {this.userId, this.name, this.request, this.note, this.created});

  CommandsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    request = json['request'];
    note = json['note'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['request'] = request;
    data['note'] = note;
    data['created'] = created;
    return data;
  }
}
