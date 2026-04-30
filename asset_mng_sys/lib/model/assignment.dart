import 'package:asset_mng_sys/model/asset.dart';

class Assignment {
  final int assignId;
  final String assignedDate;
  final Asset asset;

  Assignment({required this.assignId, required this.assignedDate, required this.asset});

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      assignId: json['assignId'],
      assignedDate: json['assignedDate'],
      asset: Asset.fromJson(json['asset']),
    );
  }
}