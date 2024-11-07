class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class InternetException extends AppException {
  InternetException() : super("No internet Connection");
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException() : super("Request Timeout");
}

class BadRequestException extends AppException {
  BadRequestException(super.message);
}
