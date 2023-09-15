import 'package:floatingbubble/constants/constants.dart';

class ReorderListModel {
  int index;
  String title;
  ViewType viewType;

  ReorderListModel({
    this.index,
    this.title,
    this.viewType,
  });

  ReorderListModel.fromJson(Map<String, dynamic> json) {
    index = json['index'] as int;
    title = json['title'] as String;
    viewType = json['view_type'] as ViewType;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['title'] = title;
    data['view_type'] = viewType.toString();
    return data;
  }
}
