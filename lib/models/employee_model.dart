class EmployeeModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  EmployeeModel(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar,
  );

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    avatar = json['avatar'];
  }
}




//  "id": 7,
//   "email": "michael.lawson@reqres.in",
//   "first_name": "Michael",
//   "last_name": "Lawson",
//   "avatar": "https://reqres.in/img/faces/7-image.jpg"