import 'package:asset_mng_sys/services/homeservice.dart';
import 'package:flutter/material.dart';

class RequestAssetPage extends StatefulWidget {
  final int userId; 
  const RequestAssetPage({required this.userId, super.key});

  @override
  State<RequestAssetPage> createState() => _RequestAssetPageState();
}

class _RequestAssetPageState extends State<RequestAssetPage> {
  @override
  void initState() {
    super.initState();
  }
  String? selectedAssetType;
  final TextEditingController _reasonController = TextEditingController();
  final List<String> assetTypes = ['Laptop', 'Mouse', 'Monitor', 'Keyboard', 'Headset'];
  Homeservice homeService=Homeservice();
  void _submitRequest() async {
    
    if (selectedAssetType != null && _reasonController.text.isNotEmpty) {
      Map<String, dynamic> requestData = {
        "requestId": widget.userId,
        "assetType": selectedAssetType,
        "reason": _reasonController.text,
        "requestDate": DateTime.now().toIso8601String(),
        "status": "Pending"
      };
      print(requestData);

    bool success = await homeService.requestAssets(requestData);
      
      if (success) {
        Navigator.pop(context); 
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Request Submitted!")));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something wen Wrong!")));
      }
    }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Request New Asset")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Asset Type"),
              items: assetTypes.map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
              onChanged: (val) => setState(() => selectedAssetType = val),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _reasonController,
              maxLines: 3,
              decoration: const InputDecoration(labelText: "Reason for Request", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitRequest,
              child: const Text("Submit Request"),
            )
          ],
        ),
      ),
    );
  }
}

 