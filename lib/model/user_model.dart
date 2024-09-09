class AuthResponse {
  Data data;
  String generatedAt;
  String statusCode;
  String? userMessage;
  String? systemMessage;
  String? systemErrorMessage;
  String? systemErrorType;
  String? systemErrorStack;
  dynamic validationProblemDetails;

  AuthResponse({
    required this.data,
    required this.generatedAt,
    required this.statusCode,
    this.userMessage,
    this.systemMessage,
    this.systemErrorMessage,
    this.systemErrorType,
    this.systemErrorStack,
    this.validationProblemDetails,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: Data.fromJson(json['data']),
      generatedAt: json['generatedAt'],
      statusCode: json['statusCode'],
      userMessage: json['userMessage'],
      systemMessage: json['systemMessage'],
      systemErrorMessage: json['systemErrorMessage'],
      systemErrorType: json['systemErrorType'],
      systemErrorStack: json['systemErrorStack'],
      validationProblemDetails: json['validationProblemDetails'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
      'generatedAt': generatedAt,
      'statusCode': statusCode,
      'userMessage': userMessage,
      'systemMessage': systemMessage,
      'systemErrorMessage': systemErrorMessage,
      'systemErrorType': systemErrorType,
      'systemErrorStack': systemErrorStack,
      'validationProblemDetails': validationProblemDetails,
    };
  }
}

class Data {
  String accessToken;
  String refreshToken;
  int expiresIn;

  Data({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiresIn: json['expiresIn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }
}
