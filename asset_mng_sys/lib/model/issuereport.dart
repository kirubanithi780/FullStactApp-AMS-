class Issuereport {
  String reporterName;
  String reporterEmail;
  String description;
  

  Issuereport({required this.description,required this.reporterEmail,required this.reporterName});

  
  factory Issuereport.fromJson(Map<String, dynamic> json) {
    return Issuereport(
       reporterName: json[' reporterName'],
     reporterEmail: json['reporterEmail'],
     description:json['description']
    
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reporterName': reporterName,
      'reporterEmail':reporterEmail,
      'description':description

    };
  }
 

}