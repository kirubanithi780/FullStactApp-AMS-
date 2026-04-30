import 'package:asset_mng_sys/model/issuereport.dart';
import 'package:asset_mng_sys/services/homeservice.dart';
import 'package:flutter/material.dart';


class IssueReportPage extends StatefulWidget {
  const IssueReportPage({super.key});

  @override
  State<IssueReportPage> createState() => _IssueReportPageState();
}

class _IssueReportPageState extends State<IssueReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Issue Report Form')),
        body: const IssueForm(),
    );
  }
}

class IssueForm extends StatefulWidget {
  const IssueForm({super.key});

  @override
  IssueFormState createState() => IssueFormState();
}

class IssueFormState extends State<IssueForm> {
  Homeservice homeService=Homeservice();
  final _formKey = GlobalKey<FormState>();
  
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final issueController = TextEditingController();

  
  void reportIssue() async {
  
  Issuereport report = Issuereport(
    description: issueController.text, 
    reporterEmail: emailController.text, 
    reporterName: nameController.text,
  );

  dynamic success = await homeService.reportIssue(report);


  if (!mounted) return;

  if (success == true) {
  
    setState(() {
      nameController.clear();
      emailController.clear();
      issueController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Successfully submitted the report")),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Something went wrong")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form( 
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Mail ID'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: issueController,
                decoration: const InputDecoration(labelText: 'Issue Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the issue';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Submitting Form...')),
                    );
                    reportIssue();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  
}