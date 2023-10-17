class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? cks;
  String? city;
  String? province;
  List? address;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
    this.cks,
    this.city,
    this.province,
    this.address,
  });

  // receiving data from server
  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'],
      email: json['email'],
      firstName: json['firstName'],
      secondName: json['secondName'],
      cks: json['cks'],
      city: json['city'],
      province: json['province'],
      address: List<String>.from(json['address'] ?? []));

  // sending data to our server
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'firstName': firstName,
        'secondName': secondName,
        'cks': cks,
        'city': city,
        'province': province,
        'address': address,
      };
}
