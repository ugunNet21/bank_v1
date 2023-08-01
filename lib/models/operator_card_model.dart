

import 'data_plan_model.dart';

class OperatorCardModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final String? createdAt;
  final String? updatedAt;
  final List<DataPlanModel>? dataPlans;

  OperatorCardModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
    this.dataPlans,
  });

  factory OperatorCardModel.fromJson(Map<String, dynamic> json) =>
      OperatorCardModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        thumbnail: json['thumbnail'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        dataPlans: json['data_plans'] == null
            ? null
            : (json['data_plans'] as List)
                .map((dataPlan) => DataPlanModel.fromJson(dataPlan))
                .toList(),
      );
}
