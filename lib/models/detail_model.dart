import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetail {
  String? name;
  String? category;
  String? highestQualification;
  String? location;

  UserDetail({
    this.name,
    this.category,
    this.highestQualification,
    this.location,
  });
  UserDetail.fromMap(DocumentSnapshot data) {
    name = data['name'];
    category = data['category'];
    highestQualification = data['highestQualification'];
    location = data['location'];
  }
}
