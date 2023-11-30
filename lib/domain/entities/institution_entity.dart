import 'dart:convert';

import 'package:empresta_super_app/data/models/institution_model.dart';

class InstitutionEntity {
  List<InstitutionModel> items;

  InstitutionEntity({required this.items});

  factory InstitutionEntity.fromJson(List<dynamic> json) {
    List<InstitutionModel> itemList =
        json.map((item) => InstitutionModel.fromJson(item)).toList();
    return InstitutionEntity(items: itemList);
  }

  String toJsonString() {
    return json.encode(items.map((item) => item.toJson()).toList());
  }
}
