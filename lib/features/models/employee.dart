class Employee {
  final String createdAt;
  final String name;
  final String avatar;
  final String emailId;
  final String mobile;
  final String country;
  final String state;
  final String district;
  final String id;

  Employee({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.emailId,
    required this.mobile,
    required this.country,
    required this.state,
    required this.district,
    required this.id,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      createdAt: json['createdAt']??"",
      name: json['name']??"",
      avatar: json['avatar']??"",
      emailId: json['emailId']??"",
      mobile: json['mobile']??"",
      country: json['country']??"",
      state: json['state']??"",
      district: json['district']??"",
      id: json['id']??"",
    );
  }
}
