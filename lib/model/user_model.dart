class UserModelAPIResponse {
  Response? response;
  UserModelAPIResponse? result;

  UserModelAPIResponse({this.response, this.result});

  factory UserModelAPIResponse.fromJson(Map<String, dynamic> json) =>
      UserModelAPIResponse(
          response: json['response'] != null
              ? Response.fromJson(json['response'])
              : null,
          result: json['result'] != null
              ? UserModelAPIResponse.fromJson(json['result'])
              : null);
}

class Response {
  int? responseId;
  String? responseDesc;

  Response({this.responseId, this.responseDesc});

  factory Response.fromJson(Map<String, dynamic> json) => Response(
      responseId: json['response_id'], responseDesc: json['response_desc']);
}

class UserModel {
  String? primaryNumber;
  String? fullName;
  int? employeeId;
  String? firstName;
  String? lastName;
  String? email;
  int? isLead;
  int? cityId;

  UserModel(
      {this.primaryNumber,
      this.fullName,
      this.employeeId,
      this.firstName,
      this.lastName,
      this.email,
      this.isLead,
      this.cityId});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      primaryNumber: json['primary_number'],
      fullName: json['full_name'],
      employeeId: json['employee_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      isLead: json['is_lead'],
      cityId: json['city_id']);
}
