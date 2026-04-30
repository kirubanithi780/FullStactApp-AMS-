class Asset {
  final int assetId;
  final String itemName;
  final int tagNumber;
  final String status;

  Asset({required this.assetId, required this.itemName, required this.tagNumber, required this.status});

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      assetId: json['assetId'],
      itemName: json['itemName'],
      tagNumber: json['tagNumber'],
      status: json['status'],
    );
  }
}