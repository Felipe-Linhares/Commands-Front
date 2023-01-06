class CommandsModel {
  String? name;
  String? request;
  String? note;

  CommandsModel({this.name, this.request, this.note});

  CommandsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    request = json['request'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['request'] = request;
    data['note'] = note;
    return data;
  }
}
