import 'package:asset_mng_sys/model/user.dart';

class RequestAsset{
   String reason;
  String assetType;

  RequestAsset({required this.reason,required this.assetType});

    factory RequestAsset.fromJson(Map<String, dynamic> json) {
    return RequestAsset(
      reason: json['reason'],
      assetType: json['assetType'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'reason': reason,
      'assetType': assetType,
    };
  }
}
