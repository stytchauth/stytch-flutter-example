class ErrorResponse {
  final int statusCode;
  final String requestId;
  final String errorType;
  final String errorMessage;
  final String errorUrl;

  const ErrorResponse({
    required this.statusCode,
    required this.requestId,
    required this.errorType,
    required this.errorMessage,
    required this.errorUrl,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json['status_code'],
      requestId: json['request_id'],
      errorType: json['error_type'],
      errorMessage: json['error_message'],
      errorUrl: json['error_url'],
    );
  }
}

class LoginResponse {
  final int statusCode;
  final String requestId;
  final String userId;
  final String phoneId;
  final bool userCreated;

  const LoginResponse({
    required this.statusCode,
    required this.requestId,
    required this.userId,
    required this.phoneId,
    required this.userCreated,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['status_code'],
      requestId: json['request_id'],
      userId: json['user_id'],
      phoneId: json['phone_id'],
      userCreated: json['user_created'],
    );
  }
}

class AuthenticateResponse {
  final int statusCode;
  final String userId;
  final String methodId;

  const AuthenticateResponse({
    required this.statusCode,
    required this.userId,
    required this.methodId,
  });

  factory AuthenticateResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticateResponse(
      statusCode: json['status_code'],
      userId: json['user_id'],
      methodId: json['method_id'],
    );
  }
}
